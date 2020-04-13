import Combine
import Foundation

final class ListViewModel: ObservableObject {

    @Published var items: [ItemsResponse] = []
    @Published var isLoading = false

    private var cancellables: Set<AnyCancellable> = []

    private let perPage = 20
    private var currentPage = 1

    func loadNext(item: ItemsResponse) {
        if items.isLastItem(item) {
            self.currentPage += 1
            getQiitaList(page: currentPage, perPage: perPage) { [weak self] result in
                self?.handleResult(result)
            }
        }
    }

    func onAppear() {
        getQiitaList(page: currentPage, perPage: perPage) { [weak self] result in
             self?.handleResult(result)
        }
    }

    private func getQiitaList(page: Int, perPage: Int,
                              completion: @escaping (Result<[ItemsResponse], Error>) -> Void) {

        let parameters: [String: Any] = [
            "page": currentPage,
            "per_page": perPage,
        ]

        guard let url = URL(string: "https://qiita.com/api/v2/items"),
            let request = makeGetRequest(url: url, parameters: parameters) else {
                return completion(.failure(APIError.requestError))
        }
        fetch(request: request) { result in
            completion(Result {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                return try decoder.decode([ItemsResponse].self, from: result.get())
            })
        }
    }

    private func fetch(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                return completion(.failure(APIError.response(error)))
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                return completion(.failure(APIError.invalidResponse(response)))
            }
            guard (200 ..< 300) ~= httpResponse.statusCode else {
                return completion(.failure(APIError.invalidStatusCode(httpResponse.statusCode)))
            }
            guard let data = data else {
                return completion(.failure(APIError.noResponseData))
            }
            return completion(.success(data))
        }.resume()
    }

    private func makeGetRequest(url: URL, parameters: [String: Any]) -> URLRequest? {
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return nil
        }
        components.queryItems = parameters.map { (arg) -> URLQueryItem in
            let (key, value) = arg
            return URLQueryItem(name: key, value: String(describing: value))
        }
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        return request
    }

    private func handleResult(_ result: Result<[ItemsResponse], Error>) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.isLoading = false
            switch result {
            case .success(let items):
                self.currentPage += 1
                self.items.append(contentsOf: items)
            case .failure(let error):
                self.currentPage = 1
                print(error)
            }
        }
    }
}

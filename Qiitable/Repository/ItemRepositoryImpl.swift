import Foundation
import Combine

final class ItemRepositoryImpl: ItemRepository {
    private let connection: Connection
    var cancellables: Set<AnyCancellable> = []

    init(connection: Connection) {
        self.connection = connection
    }

    func fetch(page: Int, completion: @escaping (Swift.Result<[Item], Error>) -> Void) {
        let request = ItemRequest(page: page)
        return connection.call(request: request)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    completion(.failure(error))
                }
            }, receiveValue: { items in
                completion(.success(items))
            }).store(in: &cancellables)
    }
}

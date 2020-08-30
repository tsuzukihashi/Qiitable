import Foundation
import Combine

final class ItemRepositoryImpl: ItemRepository {
    private let connection: Connection
    var cancellables: Set<AnyCancellable> = []

    init(connection: Connection) {
        self.connection = connection
    }

    deinit {
        cancellables.forEach { $0.cancel() }
    }

    func fetch(completion: @escaping (Swift.Result<[Item], Error>) -> Void) {
        let request = ItemRequest()
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

import Foundation
import Combine

final class ItemRepositoryImpl: ItemRepository {
    private let connection: Connection
    init(connection: Connection) {
        self.connection = connection
    }

    func fetch() -> AnyPublisher<[Item], Error> {
        let request = ItemRequest()
        return connection.call(request: request)
    }
}

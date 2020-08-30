import Foundation
import Combine

public protocol ItemRepository {
    func fetch() -> AnyPublisher<[Item], Error>
}

import Foundation
import Combine

/// @mockable
public protocol ItemRepository {
    func fetch() -> AnyPublisher<[Item], Error>
}

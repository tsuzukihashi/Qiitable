import Foundation
import Combine

/// @mockable
public protocol ItemRepository {
    func fetch(completion: @escaping (Swift.Result<[Item], Error>) -> Void)
}

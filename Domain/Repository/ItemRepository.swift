import Foundation
import Combine

/// @mockable
public protocol ItemRepository {
    func fetch(page: Int, completion: @escaping (Swift.Result<[Item], Error>) -> Void)
}

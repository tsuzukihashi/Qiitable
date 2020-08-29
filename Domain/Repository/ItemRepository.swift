import Foundation

public protocol ItemRepository {
    func fetch(completion: @escaping (Swift.Result<Item, Error>) -> Void)
}

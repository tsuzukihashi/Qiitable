///
/// @Generated by Mockolo
///



import Combine
import Foundation


public class ItemRepositoryMock: ItemRepository {
    public init() { }


    public var fetchCallCount = 0
    public var fetchHandler: ((@escaping (Swift.Result<[Item], Error>) -> Void) -> ())?
    public func fetch(completion: @escaping (Swift.Result<[Item], Error>) -> Void)  {
        fetchCallCount += 1
        if let fetchHandler = fetchHandler {
            fetchHandler(completion)
        }
        
    }
}


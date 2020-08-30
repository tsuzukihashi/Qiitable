import XCTest
@testable import Qiitable
import StubKit
import Combine

class ItemRepositoryTests: XCTestCase {
    var subject: ItemRepositoryImpl!
    var connection: ConnectionMock!

    override func setUp() {
        connection = .init()
        subject = .init(connection: connection)
    }

    func test_fetch() {
        XCTxContext("成功したとき") {
            let item = try! Stub.make(Item.self)

            connection.callHandler = { req in
                if let req = req as? ItemRequest {
                    XCTAssertEqual(req, ItemRequest())
                }
                return Future<[Item], Error> { promise in
                    promise(.success([item]))
                }.eraseToAnyPublisher()
            }
            
            subject.fetch { _ in }

            XCTAssertEqual(connection.callCallCount, 1)
        }
    }
}

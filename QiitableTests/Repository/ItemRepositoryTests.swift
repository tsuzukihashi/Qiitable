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
            
            subject.fetch { result in
                if case .success(let items) = result {
                    XCTAssertEqual(items, [item])
                }
            }

            XCTAssertEqual(connection.callCallCount, 1)
        }
        XCTxContext("失敗したとき") {
            connection.callHandler = { req in
                if let req = req as? ItemRequest {
                    XCTAssertEqual(req, ItemRequest())
                }
                return Future<[Item], Error> { promise in
                    promise(.failure(ErrorMock.test))
                }.eraseToAnyPublisher()
            }

            subject.fetch { result in
                if case .failure(let error) = result {
                    XCTAssertEqual(error as! ErrorMock, ErrorMock.test)
                }
            }

            XCTAssertEqual(connection.callCallCount, 1)
        }
    }
}

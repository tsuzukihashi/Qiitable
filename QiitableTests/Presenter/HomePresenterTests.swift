import XCTest
@testable import Qiitable
import StubKit

class HomePresenterrTests: XCTestCase {
    var subject: HomePresenterImpl!
    var router: HomeRouterMock!
    var useCase: HomeUseCaseMock!

    override func setUp() {
        router = .init()
        useCase = .init()
        subject = .init(router: router, useCase: useCase)
    }

    override class func tearDown() {
        super.tearDown()
    }

    func test_onAppear() {
        XCTxContext("リクエストが成功したとき、記事が取得されること") {
            let stub = try! Stub.make(Item.self)
            useCase.fetchHandler = { completion in
                completion(.success([stub]))
            }

            subject.onAppear()

            XCTAssertEqual(useCase.fetchCallCount, 1)
            XCTAssertEqual(subject.items, [stub])
        }
        XCTxContext("リクエストが失敗したとき") {
            useCase.fetchHandler = { completion in
                completion(.failure(ErrorMock.test))
            }

            subject.onAppear()

            XCTAssertEqual(useCase.fetchCallCount, 1)
        }
    }
}

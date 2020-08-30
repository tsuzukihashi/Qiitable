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

    func test_onAppear() {
        let stub = try! Stub.make(Item.self)
        useCase.fetchHandler = { completion in
            completion(.success([stub]))
        }

        subject.onAppear()

        XCTAssertEqual(useCase.fetchCallCount, 1)
        XCTAssertEqual(subject.items, [stub])
    }
}

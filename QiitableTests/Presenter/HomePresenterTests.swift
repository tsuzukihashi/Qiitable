import XCTest
@testable import Qiitable

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
    }
}

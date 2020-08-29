import XCTest
@testable import Qiitable

class RootRouterMock: RootRouter {
    var makeHomeViewCallCount = 0
    func makeHomeView() -> HomeView {
        makeHomeViewCallCount += 1
        return HomeView()
    }
}

class RootPresenterTests: XCTestCase {
    var subject: RootPresenterImpl!
    var router: RootRouterMock!

    override func setUp() {
        router = .init()
        subject = .init(router: router)
    }

    func test_showHomeView() {
        _ = subject.showHomeView()

        XCTAssertEqual(router.makeHomeViewCallCount, 1)
    }
}

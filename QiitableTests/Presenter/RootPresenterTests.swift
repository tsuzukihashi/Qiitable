import XCTest
@testable import Qiitable

class HomePresenterMock: HomePresenter {

}

class RootRouterMock: RootRouter {
    var makeHomeViewCallCount = 0
    func makeHomeView() -> HomeView<HomePresenterImpl> {
        makeHomeViewCallCount += 1
        return HomeView(presenter: HomePresenterImpl(router: HomeRouterMock()))
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

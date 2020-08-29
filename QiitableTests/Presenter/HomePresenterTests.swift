import XCTest
@testable import Qiitable

class HomeRouterMock: HomeRouter {

}

class HomePresenterTests: XCTestCase {
    var subject: HomePresenterImpl!
    var router: HomeRouterMock!

    override func setUp() {
        router = .init()
        subject = .init(router: router)
    }
}

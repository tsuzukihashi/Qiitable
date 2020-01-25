import XCTest
@testable import Qiitable

class HomePresenterTests: XCTestCase {
    
    var presenter: HomePresenterMock!

    override func setUp() {
        presenter = HomePresenterMock()
    }

    func test_onAppar() {
        presenter.onAppar()
        
        XCTAssertEqual(presenter.onAppar_calledCount, 1)
    }

}

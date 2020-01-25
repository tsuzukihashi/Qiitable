import Foundation
@testable import Qiitable

class HomePresenterMock: HomePresenter {
    var onAppar_calledCount = 0
    func onAppar() {
        onAppar_calledCount += 1
    }

    var getItems_calledCount = 0
    func getItems() {
        getItems_calledCount += 1
    }
}

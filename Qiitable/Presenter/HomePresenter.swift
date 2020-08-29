import Foundation

protocol HomePresenter: ObservableObject {

}

final class HomePresenterImpl: HomePresenter {
    private let router: HomeRouter

    init(router: HomeRouter) {
        self.router = router
    }
}

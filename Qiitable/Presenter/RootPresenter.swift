import Foundation

protocol RootPresenter: ObservableObject {
    func showHomeView() -> HomeView
}

final class RootPresenterImpl: RootPresenter {
    private let router: RootRouter

    init(router: RootRouter) {
        self.router = router
    }

    func showHomeView() -> HomeView {
        router.transitionToHomeView()
    }
}

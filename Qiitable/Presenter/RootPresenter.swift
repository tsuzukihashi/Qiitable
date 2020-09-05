import Foundation
import StubKit

/// @mockable
protocol RootPresenter: ObservableObject {
    func showHomeView() -> HomeView
    func showSearchView() -> SearchView
}

final class RootPresenterImpl: RootPresenter {
    private let router: RootRouter

    init(router: RootRouter) {
        self.router = router
    }

    func showHomeView() -> HomeView {
        router.makeHomeView()
    }

    func showSearchView() -> SearchView {
        router.makeSearchView()
    }
}

import Foundation
import StubKit

/// @mockable
protocol RootPresenter: ObservableObject {
    func showHomeView() -> HomeView<HomePresenterImpl>
}

final class RootPresenterImpl: RootPresenter {
    private let router: RootRouter

    init(router: RootRouter) {
        self.router = router
    }

    func showHomeView() -> HomeView<HomePresenterImpl> {
        router.makeHomeView()
    }
}

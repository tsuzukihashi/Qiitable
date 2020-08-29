import Foundation

protocol RootRouter {
    func makeHomeView() -> HomeView<HomePresenterImpl>
}

final class RootRouterImpl: RootRouter {
    func makeHomeView() -> HomeView<HomePresenterImpl> {
        return HomeView(presenter: HomePresenterImpl(router: HomeRouterImpl()))
    }
}

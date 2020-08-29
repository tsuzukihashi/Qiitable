import Foundation

protocol RootRouter {
    func makeHomeView() -> HomeView
}

final class RootRouterImpl: RootRouter {
    func makeHomeView() -> HomeView {
        return HomeView()
    }
}

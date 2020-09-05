import Foundation

/// @mockable
protocol RootRouter {
    func makeHomeView() -> HomeView
    func makeSearchView() -> SearchView
}

final class RootRouterImpl: RootRouter {
    func makeHomeView() -> HomeView {
        let connection = ConnectionImpl(session: URLSession.shared)
        let repository = ItemRepositoryImpl(connection: connection)
        let useCase = HomeUseCaseImpl(repository: repository)
        let router = HomeRouterImpl()
        return HomeView(presenter: HomePresenterImpl(router: router, useCase: useCase))
    }

    func makeSearchView() -> SearchView {
        return SearchView()
    }
}

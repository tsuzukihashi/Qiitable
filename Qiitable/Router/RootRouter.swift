import Foundation

protocol RootRouter {
    func makeHomeView() -> HomeView<HomePresenterImpl>
}

final class RootRouterImpl: RootRouter {
    func makeHomeView() -> HomeView<HomePresenterImpl> {
        let connection = ConnectionImpl(session: URLSession.shared)
        let repository = ItemRepositoryImpl(connection: connection)
        let useCase = HomeUseCaseImpl(repository: repository)
        let router = HomeRouterImpl()
        return HomeView(presenter: HomePresenterImpl(router: router, useCase: useCase))
    }
}

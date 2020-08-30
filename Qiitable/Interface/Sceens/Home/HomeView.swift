import SwiftUI

struct HomeView<Presenter: HomePresenter>: View {
    @ObservedObject var presenter: Presenter

    var body: some View {
        NavigationView {
            List(presenter.items) { item in
                Text(item.title)
            }
        }.onAppear() {
            self.presenter.onAppear()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            presenter: HomePresenterImpl(
                router: HomeRouterImpl(),
                useCase: HomeUseCaseImpl(
                    repository: ItemRepositoryImpl(
                        connection: ConnectionImpl(
                            session: URLSession.shared
                        )
                    )
                )
            )
        )
    }
}

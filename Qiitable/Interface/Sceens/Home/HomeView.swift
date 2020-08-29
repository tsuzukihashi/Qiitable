import SwiftUI

struct HomeView<Presenter: HomePresenter>: View {
    @ObservedObject var presenter: Presenter

    var body: some View {
        Text("Home")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(presenter: HomePresenterImpl(router: HomeRouterImpl()))
    }
}

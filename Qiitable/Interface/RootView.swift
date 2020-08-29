import SwiftUI

struct RootView<Presenter: RootPresenter>: View {
    @ObservedObject var presenter: Presenter
    @EnvironmentObject private var appState: AppState

    var body: some View {
        ZStack {
            presenter.showHomeView()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(presenter: RootPresenterImpl(router: RootRouterImpl()))
    }
}

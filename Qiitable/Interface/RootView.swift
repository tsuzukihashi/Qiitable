import SwiftUI

struct RootView<Presenter: RootPresenter>: View {
    @ObservedObject var presenter: Presenter

    var body: some View {
        ZStack {
            TabBar(presenter: presenter)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(presenter: RootPresenterImpl(router: RootRouterImpl()))
    }
}

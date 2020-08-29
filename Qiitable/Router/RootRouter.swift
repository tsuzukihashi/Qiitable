import SwiftUI

protocol RootRouter {
    func transitionToHomeView() -> HomeView
}

final class RootRouterImpl: RootRouter {

    init() {

    }
    
    func transitionToHomeView() -> HomeView {
        return HomeView()
    }
}

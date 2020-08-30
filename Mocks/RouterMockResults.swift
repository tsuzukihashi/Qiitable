///
/// @Generated by Mockolo
///



import Foundation


class HomeRouterMock: HomeRouter {
    init() { }


}

class RootRouterMock: RootRouter {
    init() { }


    var makeHomeViewCallCount = 0
    var makeHomeViewHandler: (() -> (HomeView<HomePresenterImpl>))?
    func makeHomeView() -> HomeView<HomePresenterImpl> {
        makeHomeViewCallCount += 1
        if let makeHomeViewHandler = makeHomeViewHandler {
            return makeHomeViewHandler()
        }
        fatalError("makeHomeViewHandler returns can't have a default value thus its handler must be set")
    }
}

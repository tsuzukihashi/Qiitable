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
    var makeHomeViewHandler: (() -> (HomeView))?
    func makeHomeView() -> HomeView {
        makeHomeViewCallCount += 1
        if let makeHomeViewHandler = makeHomeViewHandler {
            return makeHomeViewHandler()
        }
        fatalError("makeHomeViewHandler returns can't have a default value thus its handler must be set")
    }

    var makeSearchTopViewCallCount = 0
    var makeSearchTopViewHandler: (() -> (SearchTopView))?
    func makeSearchTopView() -> SearchTopView {
        makeSearchTopViewCallCount += 1
        if let makeSearchTopViewHandler = makeSearchTopViewHandler {
            return makeSearchTopViewHandler()
        }
        fatalError("makeSearchTopViewHandler returns can't have a default value thus its handler must be set")
    }
}

class SearchTopRouterMock: SearchTopRouter {
    init() { }


    var makeSearchListViewCallCount = 0
    var makeSearchListViewHandler: ((String) -> (SearchListView))?
    func makeSearchListView(text: String) -> SearchListView {
        makeSearchListViewCallCount += 1
        if let makeSearchListViewHandler = makeSearchListViewHandler {
            return makeSearchListViewHandler(text)
        }
        fatalError("makeSearchListViewHandler returns can't have a default value thus its handler must be set")
    }
}


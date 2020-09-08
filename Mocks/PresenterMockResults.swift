///
/// @Generated by Mockolo
///



import Combine
import Foundation


class HomePresenterMock: HomePresenter {
    init() { }
    init(items: [Item] = [Item]()) {
        self.items = items
    }


    var itemsSetCallCount = 0
    var items: [Item] = [Item]() { didSet { itemsSetCallCount += 1 } }

    var onAppearCallCount = 0
    var onAppearHandler: (() -> ())?
    func onAppear()  {
        onAppearCallCount += 1
        if let onAppearHandler = onAppearHandler {
            onAppearHandler()
        }
        
    }

    var loadNextCallCount = 0
    var loadNextHandler: ((Item) -> ())?
    func loadNext(item: Item)  {
        loadNextCallCount += 1
        if let loadNextHandler = loadNextHandler {
            loadNextHandler(item)
        }
        
    }
}

class RootPresenterMock: RootPresenter {
    init() { }


    var showHomeViewCallCount = 0
    var showHomeViewHandler: (() -> (HomeView))?
    func showHomeView() -> HomeView {
        showHomeViewCallCount += 1
        if let showHomeViewHandler = showHomeViewHandler {
            return showHomeViewHandler()
        }
        fatalError("showHomeViewHandler returns can't have a default value thus its handler must be set")
    }

    var showSearchTopViewCallCount = 0
    var showSearchTopViewHandler: (() -> (SearchTopView))?
    func showSearchTopView() -> SearchTopView {
        showSearchTopViewCallCount += 1
        if let showSearchTopViewHandler = showSearchTopViewHandler {
            return showSearchTopViewHandler()
        }
        fatalError("showSearchTopViewHandler returns can't have a default value thus its handler must be set")
    }
}


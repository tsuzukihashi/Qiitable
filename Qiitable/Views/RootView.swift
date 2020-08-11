import SwiftUI

enum TabState: Hashable {
    case home
    case search
    case random
    case history
    case mypage
}

struct RootView: View {
    @State private var tabState: TabState = .home
    
    var body: some View {
        TabView(selection: $tabState) {
            HomeView(viewModel: ListViewModel())
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                            .imageScale(.large)
                        Text("home")
                    }
            }.tag(TabState.home)
            
            SearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                        Text("search")
                    }
            }.tag(TabState.search)
            
            RandomView()
                .tabItem {
                    VStack {
                        Image(systemName: "pencil.and.outline")
                            .imageScale(.large)
                        Text("random")
                    }
            }.tag(TabState.random)
            
            HistoryView()
                .tabItem {
                    VStack {
                        Image(systemName: "clock")
                            .imageScale(.large)
                        Text("history")
                    }
            }.tag(TabState.history)
            
            MyPageView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill")
                            .imageScale(.large)
                        Text("mypage")
                    }
            }.tag(TabState.mypage)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

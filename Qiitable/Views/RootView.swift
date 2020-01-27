import SwiftUI

struct RootView: View {
    @State var tabStatus: TabStatus = .home
    
    var body: some View {
        ZStack {
            // HOME
            HomeView()
                .opacity(tabStatus == .home ? 1 : 0)
//            // SEARCH
            SearchView()
                .opacity(tabStatus == .search ? 1 : 0)
//            // RANDOM
            RandomView()
                .opacity(tabStatus == .random ? 1 : 0)
//            // HISTORY
//            HomeView()
//                .opacity(tabStatus == .history ? 1 : 0)
//            // MYPAGE
//            HomeView()
//                .opacity(tabStatus == .mypage ? 1 : 0)
            // TAB
            CustomTabView(tabInfo: self.$tabStatus)
        }
        .animation(.spring())
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

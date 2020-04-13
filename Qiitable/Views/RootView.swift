import SwiftUI

struct RootView: View {
    @State var tabStatus: TabStatus = .home
    
    private func tete() -> ListViewModel {
        return ListViewModel()
    }
    var body: some View {
        ZStack {
            // HOME
            HomeView(viewModel: tete())
                .opacity(tabStatus == .home ? 1 : 0)
            // SEARCH
            SearchView()
                .opacity(tabStatus == .search ? 1 : 0)
            // RANDOM
            RandomView()
                .opacity(tabStatus == .random ? 1 : 0)
            // HISTORY
            HistoryView()
                .opacity(tabStatus == .history ? 1 : 0)
            // MYPAGE
            MyPageView()
                .opacity(tabStatus == .mypage ? 1 : 0)
            // TAB
            CustomTabView(tabInfo: self.$tabStatus)
                .onAppear() {
                    self.calcHeight()
            }
        }
        .animation(.spring())
    }
    
    private func calcHeight() {
        let device = UIDevice.current.model
        
        print(device)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

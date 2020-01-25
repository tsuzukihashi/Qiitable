import SwiftUI

struct RootView: View {
    var body: some View {
        ZStack {
            HomeView()
            CustomTabView()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

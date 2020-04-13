import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: ListViewModel

    var body: some View {
        NavigationView {
            List(viewModel.items) { item in
                Text(item.title)
                    .onAppear {
                        self.viewModel.loadNext(item: item)
                }
            }.onAppear {
                self.viewModel.onAppear()
            }.navigationBarTitle("検索結果")
        }
    .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static let viewModel = ListViewModel()
    static var previews: some View {
        HomeView(viewModel: viewModel)
            .previewLayout(.sizeThatFits)
    }
}

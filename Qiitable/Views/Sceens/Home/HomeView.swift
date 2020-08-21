import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.items) { item in
                    NavigationLink(
                        destination:
                        ArticleView(item: item)
                    ) {
                        ArticleCell(items: item)
                    }
                    .onAppear {
                        self.viewModel.loadNext(item: item)
                    }
                }.onAppear {
                    self.viewModel.onAppear()
                }.navigationBarTitle("検索結果")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static let viewModel = ListViewModel()
    static var previews: some View {
        HomeView(viewModel: viewModel)
            .previewLayout(.sizeThatFits)
    }
}

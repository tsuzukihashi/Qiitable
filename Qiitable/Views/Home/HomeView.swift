import SwiftUI

struct HomeView: View {
    @ObservedObject var presenter = HomePresenterImpl()
    
    var body: some View {
        NavigationView {
            List(presenter.items.indices, id: \.self) { index in
                NavigationLink(destination: ArticleView(items: self.$presenter.items[index])) {
                    ArticleCell(items: self.$presenter.items[index])
                }  
            }
            .navigationBarTitle("新着", displayMode: .automatic)

        }
        .onAppear(perform: presenter.onAppar)
        .alert(isPresented: $presenter.showAlert) { () -> Alert in
            Alert(title: Text("エラー"),
                  message: Text("\(presenter.errorCode)"),
                  dismissButton: .default(Text("エラー"),
                                          action: {
                                            self.presenter.getItems()
                  }))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(presenter: HomePresenterImpl())
            .previewLayout(.sizeThatFits)
    }
}

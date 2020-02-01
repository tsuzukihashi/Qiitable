import SwiftUI

struct HomeView: View {
    @EnvironmentObject var homePresenter: HomePresenterImpl
    
    var body: some View {
        ZStack {
            NavigationView {
                List(homePresenter.items.indices, id: \.self) { index in
                    NavigationLink(
                        destination:
                        ArticleView(item: self.$homePresenter.items[index])
                    ) {
                        ArticleCell(items: self.$homePresenter.items[index])
                    }
                }
                .navigationBarTitle("新着", displayMode: .inline)
            }
            .onAppear(perform: homePresenter.onAppar)
            .alert(isPresented: $homePresenter.showAlert) { () -> Alert in
                Alert(title: Text("エラー"),
                      message: Text("\(homePresenter.errorCode)"),
                      dismissButton: .default(Text("エラー"),
                                              action: {
                                                self.homePresenter.getItems()
                      }))
            }
            if homePresenter.showIndicator {
                CustomIndicator()
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewLayout(.sizeThatFits)
    }
}

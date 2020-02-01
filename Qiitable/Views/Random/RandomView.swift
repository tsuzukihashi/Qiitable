import SwiftUI

struct RandomView: View {
    @EnvironmentObject var randomPresenter: RandomPresenterImpl
    
    var body: some View {
        VStack {
            if randomPresenter.showIndicator == true {
                CustomIndicator()
                    .onAppear() {
                        self.randomPresenter.onAppar()
                }
            } else {
                ZStack {
                    ArticleView(item: self.$randomPresenter.items[0])
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button(action: {
                                self.randomPresenter.restart()
                            }) {
                                ZStack {
                                    Circle()
                                        .foregroundColor(.blue)
                                        .frame(width: 32, height: 32)
                                Text("+")
                                    .foregroundColor(Color.white)
                                    .padding()
                                }
                            }.padding()
                        }.padding(.bottom, 44)
                    }
                }
            }
        }
    }
}

struct RandomView_Previews: PreviewProvider {
    static var previews: some View {
        RandomView()
    }
}

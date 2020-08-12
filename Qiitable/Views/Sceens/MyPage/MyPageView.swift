import SwiftUI

struct MyPageView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 200, height: 80)
                .background(Color.gray)
                .cornerRadius(8)
            Text("ログインする")
                .foregroundColor(.backgroundMain)
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}

import SwiftUI

struct CustomTabView: View {
    @Binding var tabInfo: TabStatus

    @State var height: CGFloat = 72
    @State var color: Color = .gray

    var body: some View {
        ZStack {
            CustomTabBackground(tabInfo: self.$tabInfo,
                                height: $height, color: $color)
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(tabInfo: .constant(.home))
    }
}

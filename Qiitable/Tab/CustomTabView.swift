import SwiftUI

struct CustomTabView: View {
    @State var height: CGFloat = 88
    @State var color: Color = .gray
    
    var body: some View {
        ZStack {
            CustomTabBackground(height: $height, color: $color)
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}

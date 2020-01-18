import SwiftUI

struct CustomTabView: View {
    var height: CGFloat = 88
    var color: Color = .gray
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Rectangle()
                    .foregroundColor(self.color)
                    .frame(width: geometry.size.width, height: self.height)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}

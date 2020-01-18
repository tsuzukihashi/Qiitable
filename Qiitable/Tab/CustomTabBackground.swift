import SwiftUI

struct CustomTabBackground: View {
    @Binding var height: CGFloat
    @Binding var color: Color
    
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

struct CustomTabBackground_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBackground(height: .constant(88), color: .constant(.gray))
    }
}

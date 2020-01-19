import SwiftUI

struct CustomTabBackground: View {
    @Binding var height: CGFloat
    @Binding var color: Color
    @State var count: Int = 5
    @State var image: UIImage? = UIImage(systemName: "star")
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                ZStack {
                    Rectangle()
                        .foregroundColor(self.color)
                        .frame(width: geometry.size.width, height: self.height)
                    HStack {
                        Spacer()
                        ForEach(0 ..< self.count) { (row: Int) in
                            CustomTabItem(image: self.$image)
                            Spacer()
                        }
                    }
                }
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

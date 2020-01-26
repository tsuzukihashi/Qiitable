import SwiftUI

struct CustomTabBackground: View {
    @Binding var tabInfo: TabStatus
    @Binding var height: CGFloat
    @Binding var color: Color
    @State var count: Int = 5
    @State var image: [UIImage?] = [
        UIImage(systemName: "paperplane"),
        UIImage(systemName: "paperclip"),
        UIImage(systemName: "pencil"),
        UIImage(systemName: "folder"),
        UIImage(systemName: "trash")
    ]
    
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
                            CustomTabItem(tabInfo: self.$tabInfo,
                                          image: self.$image[row],
                                          row: row)
                                .padding(.bottom, 24)
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
        CustomTabBackground(tabInfo: .constant(.home),
                            height: .constant(88), color: .constant(.gray))
    }
}

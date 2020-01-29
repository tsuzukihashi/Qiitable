import SwiftUI

struct CustomTabItem: View {
    @Binding var tabInfo: TabStatus
    @Binding var image:  UIImage?
    var row: Int
    var size: CGFloat = 24
    var body: some View {
        Button(action: {
            self.tabInfo = TabStatus.values[self.row]
        }) {
            Image(uiImage: image!)
                .resizable()
                .foregroundColor(Color.secondary)
                .frame(width: size, height: size)
        }
    }
}

struct CustomTabItem_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabItem(tabInfo: .constant(.home),
                      image: .constant(UIImage(systemName: "star")),
                      row: 0)
            .previewLayout(.sizeThatFits)
    }
}

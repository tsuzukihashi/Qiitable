import SwiftUI

struct CustomTabItem: View {
    @Binding var image:  UIImage?
    var size: CGFloat = 28
    var body: some View {
        Button(action: {
            
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
        CustomTabItem(image: .constant(UIImage(systemName: "star")))
            .previewLayout(.sizeThatFits)
    }
}

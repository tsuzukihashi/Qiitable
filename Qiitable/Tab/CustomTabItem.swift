import SwiftUI

struct CustomTabItem: View {
    @Binding var image:  UIImage?
    var body: some View {
        Button(action: {
            
        }) {
            Image(uiImage: image!)
                .resizable()
                .foregroundColor(Color.secondary)
                .frame(width: 24, height: 24)
        }
    }
}

struct CustomTabItem_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabItem(image: .constant(UIImage(systemName: "star")))
            .previewLayout(.sizeThatFits)
    }
}

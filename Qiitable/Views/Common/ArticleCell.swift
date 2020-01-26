import SwiftUI

struct ArticleCell: View {
    @Binding var items: ItemsResponse
    var body: some View {
        VStack {
            HStack {
                Text(items.user.id ?? "")
                Spacer()
            }
            
            HStack {
                Text(items.title)
                Spacer()
            }
            
            HStack {
                ForEach(items.tags, id: \.name) { tag in
                    Text(tag.name ?? "")
                        .padding(.horizontal, 5.0)
                        .padding(.vertical, 3.0)
                        .background(Color.gray)
                        .font(.system(size: 10, weight: .light, design: .default))
                        .cornerRadius(5)
                }
                .padding(.top, 8)
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCell(items: .constant(Fixtures.getItemsResponse()))
            .previewLayout(.sizeThatFits)
    }
}

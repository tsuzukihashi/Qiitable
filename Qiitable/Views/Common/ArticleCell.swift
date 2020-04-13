import SwiftUI
import URLImage

struct ArticleCell: View {
    let items: ItemsResponse
    var body: some View {
        HStack {
            VStack {
                URLImage( URL(string: items.user.profileImageUrl!)!) { proxy in
                    proxy.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                }
                .frame(width: 50, height: 50 )
                .cornerRadius(4)
                .padding(.top, 8)
                Spacer()
            }
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
}

struct ArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCell(items: Fixtures.getItemsResponse())
            .previewLayout(.sizeThatFits)
    }
}

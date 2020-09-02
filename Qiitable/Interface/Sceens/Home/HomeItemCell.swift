import SwiftUI
import StubKit
import URLImage

struct HomeItemCell: View {
    private let item: Item

    init(item: Item) {
        self.item = item
    }

    var body: some View {
        HStack {
            URLImage(item.user.profileImageUrl.getProfileURL()) { proxy in
                proxy.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(width: 44, height: 44)
            .cornerRadius(22)
            Spacer()
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .bold()

                Text("@" + item.user.id)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.bottom, 4)

                HStack {
                    ForEach(item.tags, id: \.name) { (tag: Tag) in
                        Text(tag.name ?? "")
                            .bold()
                            .lineLimit(1)
                            .foregroundColor(.white)
                            .padding(.horizontal, 5.0)
                            .padding(.vertical, 3.0)
                            .background(Color.gray)
                            .font(.caption)
                            .cornerRadius(4)
                            .layoutPriority(1)
                    }
                    Spacer()
                }.padding(.top, 4)
            }
        }
    }
}

struct HomeItemCell_Previews: PreviewProvider {
    static var previews: some View {
        let item = try? Stub.make(Item.self)
        return HomeItemCell(item: item!)
    }
}

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
            URLImage(URL(string: "https://help.qiita.com/images/qiitan-button.png")!) { proxy in
                proxy.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(width: 44, height: 44)
            .cornerRadius(22)

            Text(item.title)
        }
    }
}

struct HomeItemCell_Previews: PreviewProvider {
    static var previews: some View {
        let item = try? Stub.make(Item.self)
        return HomeItemCell(item: item!)
    }
}

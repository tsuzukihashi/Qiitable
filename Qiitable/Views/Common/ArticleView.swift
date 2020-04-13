import SwiftUI

struct ArticleView: View {
    let item: ItemsResponse

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack {
                Text(item.title)
                    .font(.system(.title))
                Spacer()
            }
            Text(item.body ?? "")
        }
    .padding()
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(item: Fixtures.getItemsResponse())
    }
}

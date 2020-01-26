import SwiftUI

struct ArticleView: View {
    @Binding var items: ItemsResponse

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack {
                Text(items.title)
                    .font(.system(.title))
                Spacer()
            }
            Text(items.body ?? "")
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(items: .constant(Fixtures.getItemsResponse()))
    }
}

import SwiftUI
import StubKit

struct ArticleView: View {
    let item: Item

    var body: some View {
        WebView(htmlBody: item.renderedBody)
            .edgesIgnoringSafeArea(.top)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        let stub = try? Stub.make(Item.self) {
            $0.set(\.title, value: "ポケモンマスター")
        }
        return ArticleView(item: stub!)
            .previewLayout(.sizeThatFits)
    }
}

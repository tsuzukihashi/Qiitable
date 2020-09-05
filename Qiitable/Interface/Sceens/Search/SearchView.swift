import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""

    var body: some View {
        VStack {
            TextField(
                "気になる技術を調べよう！",
                text: $searchText,
                onEditingChanged: { _ in

            }) {
                // Search Action...

            }.textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            Spacer()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

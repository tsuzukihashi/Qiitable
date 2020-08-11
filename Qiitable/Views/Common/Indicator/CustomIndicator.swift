import SwiftUI

struct CustomIndicator: View {
    var body: some View {
        ZStack {
            Color.indicatorBackground
            LoaderView()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CustomIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CustomIndicator()
    }
}

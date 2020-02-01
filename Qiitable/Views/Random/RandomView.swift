import SwiftUI

struct RandomView: View {
    var body: some View {
        Text("Random View")
            .onAppear() {
                let page = Int.random(in: 1...100)
                let num = Int.random(in: 0...99)
        }
    }
}

struct RandomView_Previews: PreviewProvider {
    static var previews: some View {
        RandomView()
    }
}

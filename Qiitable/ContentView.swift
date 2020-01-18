import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.backgroundMain
            Text("Hello, Qiitable!")
            CustomTabView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

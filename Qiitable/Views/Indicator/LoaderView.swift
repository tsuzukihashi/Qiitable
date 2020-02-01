import SwiftUI

struct LoaderView: View {
    @State var isAnimation = false
    
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: 0.85)
                .stroke(
                    AngularGradient(
                        gradient: .init(colors: [.yellow, .green]),
                        center: .center),
                    style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .frame(width: 48, height: 48)
                .rotationEffect(.init(degrees: self.isAnimation ? 360 : 0))
                .animation(
                    Animation
                        .linear(duration: 0.7)
                        .repeatForever(autoreverses: false)
            )
        }
        .onAppear() {
            self.isAnimation.toggle()
        }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}

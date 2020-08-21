import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    private let htmlBody: String

    init(htmlBody: String) {
        self.htmlBody = htmlBody
    }

    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        view.allowsBackForwardNavigationGestures = true
        return view
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlBody, baseURL: nil)
    }
}

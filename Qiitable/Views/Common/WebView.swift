import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    private let htmlBody: String

    init(htmlBody: String) {
        self.htmlBody = htmlBody
    }

    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        let configure = WKWebViewConfiguration()
        let preferences = WKPreferences()
        configure.preferences = preferences
        let view = WKWebView(frame: .zero, configuration: configure)
        view.allowsBackForwardNavigationGestures = true
        view.navigationDelegate = context.coordinator
        return view
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlBody, baseURL: nil)
    }

    func makeCoordinator() -> WebView.Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        // リクエスト前
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            decisionHandler(.allow)
        }
        // レスポンス取得後
        func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
            decisionHandler(.allow)
        }
    }
}

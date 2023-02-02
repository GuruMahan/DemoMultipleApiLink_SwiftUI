//
//  webViewLoadView2.swift
//  DemoMultipleApiLink
//
//  Created by Guru Mahan on 02/01/23.
//

import SwiftUI
import WebKit

struct WebViewLoadView2: View {
    let model : EntriesInnerData?
    var body: some View {
        SwiftUIWebView(model: model)
    }
}
struct SwiftUIWebView: UIViewRepresentable {
    let model: EntriesInnerData?
    
    typealias UIViewType = WKWebView

    let webView: WKWebView

    init(model: EntriesInnerData?) {
        self.model = model
        webView = WKWebView(frame: .zero )
      
        if let url = URL(string: model?.link ?? ""){

            webView.load(URLRequest(url: url))
        }else{
            EmptyView()
                .background(Color.green)
                .ignoresSafeArea(.all)
        }

    }

    func makeUIView(context: Context) -> WKWebView {
        webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}



struct webViewLoadView2_Previews: PreviewProvider {
    static var previews: some View {
        WebViewLoadView2(model: nil)
    }
}

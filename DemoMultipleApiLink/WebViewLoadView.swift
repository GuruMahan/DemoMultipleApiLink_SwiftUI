//
//  WebView.swift
//  DemoMultipleApiLink
//
//  Created by Guru Mahan on 02/01/23.
//

import SwiftUI
import WebKit
struct WebViewLoadView: View {
  @ObservedObject var viewModel = MulitipleViewModel()
   // @State var showWebView = false
     let model : EntriesInnerData?
  
    var body: some View {
       // var urlString =  "\(model?.link ?? "")"
        VStack{
            if let url = URL(string: model?.link ?? "") {
                WebViewLoad(url: url)
                    .frame(maxWidth: .infinity,maxHeight: .infinity )
                    .cornerRadius(10)
            } else {
                EmptyView()
            }
//            Link(destination: URL(string: model?.link ?? "")!) {
//                Text("open new window")
//                    .foregroundColor(.blue)
//            }
        }
        
    }
}
struct WebViewLoad: UIViewRepresentable {
    
    var url:URL
    
    func makeUIView(context: Context) -> WKWebView {
        let web = WKWebView()
        let request = URLRequest(url: url)
        web.load(request)
        return web
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
    
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebViewLoadView( model: nil)
    }
}

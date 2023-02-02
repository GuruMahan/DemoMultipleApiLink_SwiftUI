//
//  ContentView.swift
//  DemoMultipleApiLink
//
//  Created by Guru Mahan on 01/01/23.
//

import SwiftUI

struct MultipleLinkApiView: View {
    @ObservedObject var viewModel = MulitipleViewModel()
    @State var webViewGo = false
    //@State var webView = webViewLoadView2( model: MulitipleViewModel().isSelected)

    var body: some View {
        NavigationStack{
            ScrollView{
                ZStack {
                    LinearGradient(colors: [Color.green.opacity(0.2)], startPoint:.trailing, endPoint: .leading)
                    
                    VStack {
                        ForEach(0..<(viewModel.dataList?.count ?? 0),id: \.self){ data in
                            
                            listView(list: viewModel.jsonvalue[data], data: viewModel.dataList)
                        }
                    }
                    
                }
//                .task{
//                    await viewModel.getdata()
//                }
            }
            .fullScreenCover(isPresented: $webViewGo) {
                WebViewLoadView2( model: viewModel.isSelected)
            }
//            .navigationDestination(isPresented: $webViewGo) {
//
//             WebViewLoadView2(model: viewModel.isSelected)
//            }
        }
        .onAppear {
            viewModel.getdata()
        }
        
    }
    
    @ViewBuilder func listView(list:EntriesInnerData?,data:MultipleModel?) -> some View{
       
        ZStack {
            VStack(alignment: .leading){
                HStack{
                    Text("Title: \(list?.api ?? "")")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                       .padding(.leading)
                    Spacer()
                    Button{
                        
                    }label: {
                        Image(systemName: "chevron.forward.2")
                            .foregroundColor(.black)
                            .padding()
                    }
                }
                
                Text("Category: \(list?.category ?? "")")
                   .padding(.leading)
                Text("EtryDescription: \(list?.entryDescription ?? "")")
                    .fixedSize(horizontal: false, vertical: true)
                    //.lineLimit(.max)
                   .padding(.leading)
                HStack(alignment: .top) {
                    Text("WebView:")
                        .padding(.leading)
                    Button {
                        DispatchQueue.main.async {
                            viewModel.isSelected = list
                            webViewGo = true
                        }
                    } label: {
                        Text("\(list?.link ?? "")")
                            .padding(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                          
                    }
                }
                
                
                Divider()
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
       
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleLinkApiView()
    }
}

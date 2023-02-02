//
//  MulitipleViewModel.swift
//  DemoMultipleApiLink
//
//  Created by Guru Mahan on 01/01/23.
//

import Foundation
class MulitipleViewModel: ObservableObject {
    @Published var isSelected:EntriesInnerData?
    @Published var dataList : MultipleModel?
    var link = "https://api.publicapis.org/entries"
    @Published var jsonvalue = [EntriesInnerData]()
    
//    func loadData() async {
//        guard let url = URL(string: link) else{
//            print("Invalid URL")
//            return
//        }
//        do{
//            let (data, _) = try await URLSession.shared.data(from: url)
//            if let decodedResponse = try? JSONDecoder().decode(MultipleModel.self, from: data){
//                DispatchQueue.main.async {
//                    self.jsonvalue = decodedResponse.entries!
//
//                    print(self.jsonvalue )
//                }
//
//            }
//
//        }catch{
//            print("Invalid data")
//        }
//    }
    
    func getdata() {

        guard let url = URL(string: link) else {return}

        let task = URLSession.shared.dataTask(with: url){(data, response, error)in

            guard error == nil else{return}

            guard let dat = data else {return}

            do{
                let content = try JSONDecoder().decode( MultipleModel.self, from: dat)
               

                DispatchQueue.main.async{
                    self.dataList = content
                    self.jsonvalue = content.entries
                    print(self.jsonvalue)
                 }
            } catch {
                print(error)

            }
        }
        task.resume()
    }
    
}

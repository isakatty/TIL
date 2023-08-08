//
//  ProductStore.swift
//  Cart
//
//  Created by Ham Seonwoo on 2023/08/07.
//

import Foundation

enum FetchStatus {
    case invalidURL
    case successURL
    case failedToParse
}

class ProductStore : ObservableObject{
    @Published var products: [Product] = []
    @Published var fetchMessage: String = ""
    
    init(){    }

    //이제는 json file이 아니라 api를 이용해서 보여주는 것으로 ~
    // https://mocki.io/v1/4f6767d0-a4ab-4acd-9c53-a4a1a23273d4
    
    
    // callback 지옥을 벗어나기 위해 async-await를 활용하여 API 적용
//    func fetchProducts() async {
//        
//        let urlString: String = "https://mocki.io/v1/4f6767d0-a4ab-4acd-9c53-a4a1a23273d4"
//        
//        guard let url = URL(string: urlString) else {
//            print("Wrong URL")
//            return
//        }
//        
//        do {
//            let (data, response) = try await URLSession.shared.data(from: url)
//            print("\(response)")
//            
//            let jsonString = String(data: data, encoding: .utf8)
//            print("\(jsonString ?? "")")
//            
//            products = try JSONDecoder().decode([Product].self, from: data)
//            
//            fetchMessage = ""
//        } catch {
//            debugPrint("--------")
//            debugPrint("Error loading \(url):")
//            debugPrint("\(String(describing: error))")
//            debugPrint("--------")
//            
//            fetchMessage = "상품정보 읽기 실패했습니다"
//        }
//    }
    
    
    func fetchProducts() async -> FetchStatus {
            let urlString = "https://mocki.io/v1/4f6767d0-a4ab-4acd-9c53-a4a1a23273d4" // original
//            let urlString = "https://mocki.io/v1/4f6767d0-a4ab-4acd-9c53-a4a1a23273d2" // 유효하지 않은 URL
        
            guard let url = URL(string: urlString) else {
                debugPrint("invalid url")
                return .invalidURL
            }
            
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                
                let httpResponse = response as? HTTPURLResponse
                httpResponse?.statusCode
                
                print("\(httpResponse?.statusCode ?? 202)")
                
                // 응답으로 가져온 데이터를 Published 배열에 저장
                products = try JSONDecoder().decode([Product].self, from: data)
                return .successURL
            } catch {
                debugPrint("invalid parsing")
                return .failedToParse
            }
        }
    
    
    
    
    
    // json file의 fetch와 load !!
//    func fetchFile(){
//        products = loadJsonFile("products.json")
//    }
//
//    func loadJsonFile(_ filename: String) -> [Product]{
//        let data: Data
//
//        guard let file: URL = Bundle.main.url(forResource: filename, withExtension: nil) else{
//            fatalError("\(filename) not found.")
//        }
//
//        do {
//            data = try Data(contentsOf: file)
//        } catch {
//            fatalError("Could not load \(filename) : \(error)")
//        }
//
//        do{
//            return try JSONDecoder().decode([Product].self, from: data)
//        } catch {
//            fatalError("Unable to parse \(filename) : \(error)")
//        }
//    }
    
    
}

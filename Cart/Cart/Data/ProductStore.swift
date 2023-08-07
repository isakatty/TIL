//
//  ProductStore.swift
//  Cart
//
//  Created by Ham Seonwoo on 2023/08/07.
//

import Foundation


class ProductStore : ObservableObject{
    @Published var products: [Product] = []
    
    
    // json file의 fetch와 load !!
    func fetchFile(){
        products = loadJsonFile("products.json")
    }
    
    func loadJsonFile(_ filename: String) -> [Product]{
        let data: Data
        
        guard let file: URL = Bundle.main.url(forResource: filename, withExtension: nil) else{
            fatalError("\(filename) not found.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Could not load \(filename) : \(error)")
        }
        
        do{
            return try JSONDecoder().decode([Product].self, from: data)
        } catch {
            fatalError("Unable to parse \(filename) : \(error)")
        }
    }
    
    
}

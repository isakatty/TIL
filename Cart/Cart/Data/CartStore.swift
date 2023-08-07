//
//  CartStore.swift
//  Cart
//
//  Created by Ham Seonwoo on 2023/08/07.
//

import Foundation

class CartStore: ObservableObject{
    
    @Published var products: [Product] = []
    
    
    func addProduct(_ product: Product){
        products.append(product)
    }
    
    func removeProduct(at offsets: IndexSet){
        products.remove(atOffsets: offsets)
    }
}

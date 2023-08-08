//
//  Product.swift
//  Cart
//
//  Created by Ham Seonwoo on 2023/08/07.
//

import Foundation

//enum으로 타입을 지정해주는거 어때.. ? 그래서 picker까지 구현해보는거야

extension Double {
    var currencyString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "KRW"
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}

//enum ProductCategory: Codable {
//    case device
//    case food
//    case decorattion
//    case etc
//}



struct Product: Identifiable, Codable {
    var id: String
    var productName: String
    var productPrice: Double
    var productImageURL: String
    var productURL : String
//    var productType: ProductCategory
    
    // numberFormatter 연산 프로퍼티
    
    var changedPrice: String{
        productPrice.currencyString
    }
}

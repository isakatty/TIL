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
// 모든 케이스를 보여줄거임 -> ProductCategory.allcases ->
// 모든 배열임 !!!!

//enum ProductCategory: String, CaseIterable {
//    case device = "전자기기"
//    case food = "음식"
//    case decorattion = "꾸미기"
//    case etc = "기타 등등"
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
    
    // 저 enum을 프로퍼티로 들고 와서 filter로 적용하는 방법도 있삼!!!
    
    
}

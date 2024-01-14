//
//  MovieEndPoint.swift
//  MovieListApp
//
//  Created by Jisoo HAM on 1/15/24.
//

import Foundation

//struct MovieListParameters {
//    private let key: String
//    private let targetDate: String
//    
//    private var baseURL: String {
//        return "https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?"
//    }
//    
//    init(key: String, targetDate: String) {
//        self.key = key
//        self.targetDate = targetDate
//    }
//    
//    var parameters: [String: String] {
//        [
//            "key" : key,
//            "targetDate" : targetDate
//        ]
//    }
//}
//
//extension MovieListParameters {
//    static var value: String {
//        guard let url = Bundle.main.url(forResource: "Info", withExtension: "plist"),
//              let dictionary = NSDictionary(contentsOf: url) else { return  "" }
//        
//        return dictionary["KEY"] as? String ?? ""
//    }
//}

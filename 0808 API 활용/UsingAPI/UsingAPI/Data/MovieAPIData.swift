//
//  MovieAPIData.swift
//  UsingAPI
//
//  Created by Ham Seonwoo on 2023/08/08.
//

import Foundation

struct BoxOfficeResponse: Codable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [DailyBoxOffice]
}

struct DailyBoxOffice: Codable {
    let rank: String
    let movieNm: String
    let salesAmt: String
}


struct Movie: Identifiable {
    let id = UUID()
    let rank: String
    let movieNm: String
}

struct MvChart: Identifiable{
    let id: UUID = UUID()
    
    let movieNm:String
    let salesAmt: String
    
    var salesAmntInt: Int {
        return Int(salesAmt)! / 100
    }
    
}


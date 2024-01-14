//
//  MovieResponseDTO.swift
//  MovieListApp
//
//  Created by Jisoo HAM on 1/9/24.
//

import Foundation

struct DailiyBoxOfficeDTO: Decodable {
    let boxOfficeResult: DailyBoxOfficeResultDTO
}

struct DailyBoxOfficeResultDTO: Decodable {
    let boxofficeType: String
    let showRange: String
    let dailyBoxOfficeList: [BoxOfficeListDTO]
}

struct BoxOfficeListDTO: Decodable {
    let rnum: String
    let rank: String
    let rankInten: String
    let rankOldAndNew: RankOldAndNew
    let movieCd: String
    let movieNm: String
    let openDt: String
    let salesAmt: String
    let salesShare: String
    let salesInten: String
    let salesChange: String
    let salesAcc: String
    let audiCnt: String
    let audiInten: String
    let audiChange: String
    let audiAcc: String
    let scrnCnt: String
    let showCnt: String

    func toDomain() -> BoxOfficeModel {
        BoxOfficeModel(movieName: self.movieNm, movieCode: self.movieCd, openDate: self.openDt, audiAcc: self.audiAcc)
    }
}

enum RankOldAndNew: String, Decodable {
    case new = "NEW"
    case old = "OLD"
}

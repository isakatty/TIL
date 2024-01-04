//
//  MovieDTO.swift
//  RxLearning
//
//  Created by Jisoo HAM on 1/4/24.
//

import Foundation

struct MovieInfoDTO: Decodable {
    let movieCd: String
    let movieNm: String
    let openDt: String
    let showTm: String
}

extension MovieInfoDTO {
    func toDomain() -> MovieInfo {
        MovieInfo(movieName: self.movieNm, 
                  movieCode: self.movieCd,
                  openDate: self.openDt, 
                  showTime: self.showTm)
    }
}

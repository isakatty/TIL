//
//  MovieCellViewModel.swift
//  MovieListApp
//
//  Created by Jisoo HAM on 1/9/24.
//

import Foundation

final class MovieCellViewModel {
    private let movie: BoxOfficeModel?
    
    init(movie: BoxOfficeModel?) {
        self.movie = movie
    }
    
    var movieNm: String? {
        movie?.movieName
    }
    
    var movieCd: String? {
        movie?.movieCode
    }
    
    var openDt: String? {
        movie?.openDate
    }
    
    var audiAc: String? {
        movie?.audiAcc
    }
}

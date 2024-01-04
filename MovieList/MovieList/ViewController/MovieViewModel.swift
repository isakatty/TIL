//
//  MovieViewModel.swift
//  MovieList
//
//  Created by Jisoo HAM on 1/4/24.
//

import UIKit

class MovieViewModel {
    let dataManager: MovieListType
    
    private var movie: Movie
    
    init(dataManager: MovieListType, movie: Movie) {
        self.dataManager = dataManager
        self.movie = movie
    }
    
    var movieNm: String {
        movie.movieName
    }
    
    var movieCd: String {
        movie.movieCode
    }
    
    var openDt: String {
        movie.openDate
    }
    
    var audiAc: String {
        movie.audiAcc
    }
    
    // 전화면으로 돌아가기
    func backToBeforeVC(fromCurrentVC: UIViewController, animated: Bool) {
        let navCon = fromCurrentVC.navigationController
        navCon?.popViewController(animated: animated)
    }
}

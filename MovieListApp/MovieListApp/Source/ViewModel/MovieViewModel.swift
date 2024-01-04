//
//  MovieViewModel.swift
//  MovieListApp
//
//  Created by Jisoo HAM on 1/4/24.
//

import UIKit

class MovieViewModel {
    let dataManager: MovieListManager
    
    private var movie: Movie?
    private var index: Int?
    
    init(dataManager: MovieListManager, movie: Movie? = nil, index: Int? = nil) {
        self.dataManager = dataManager
        self.movie = movie
        self.index = index
    }
    
    // DetailView에서 쓰일 프로퍼티들
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
    
    func backToBeforeVC(fromCurrentVC: UIViewController, animated: Bool) {
        let navCon = fromCurrentVC.navigationController
        navCon?.popViewController(animated: animated)
    }
}

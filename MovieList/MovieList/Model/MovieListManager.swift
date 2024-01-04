//
//  MovieManager.swift
//  MovieList
//
//  Created by Jisoo HAM on 1/4/24.
//

import Foundation

protocol MovieListType {
    func makeMovieListDatas()
    func getMovieList() -> [Movie]
}

final class MovieListManager: MovieListType {
    
    private var movieList: [Movie] = []
    
    init() {
        makeMovieListDatas()
    }
    
    func makeMovieListDatas() {
        movieList = [
            Movie(movieName: "노량: 죽음의 바다", movieCode: "20203702", openDate: "2023-12-20", audiAcc: "549527"),
            Movie(movieName: "서울의 봄", movieCode: "20212866", openDate: "2023-11-22", audiAcc: "10735041"),
            Movie(movieName: "신차원! 짱구는 못말려 더 무비 초능력 대결전 ~날아라 수제김밥~", movieCode: "20236146", openDate: "2023-12-22", audiAcc: "133542"),
            Movie(movieName: "아쿠아맨과 로스트 킹덤", movieCode: "20235735", openDate: "2023-12-20", audiAcc: "486296"),
        ]
    }
    
    func getMovieList() -> [Movie] {
        return movieList
    }
    
    
}

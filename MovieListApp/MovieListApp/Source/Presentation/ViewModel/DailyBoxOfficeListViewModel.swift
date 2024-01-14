//
//  DailyBoxOfficeListViewModel.swift
//  MovieListApp
//
//  Created by Jisoo HAM on 1/9/24.
//

import Foundation

final class DailyBoxOfficeListViewModel: MovieListViewModelProtocol {
    var movies: [BoxOfficeModel] = []
    
    private let movieRemoteRepository: MovieAPIRepository
    
    init(movieRemoteRepository: MovieAPIRepository) {
        self.movieRemoteRepository = movieRemoteRepository
        print(" init에서 \n \(movies) ")
    }
    
    // MARK: Rx로 바꾸면 <Obsevable>을 이용할 것. 
    func fetchMovies(completion: @escaping () -> Void ) {
        Task {
            guard let movieLists = try await movieRemoteRepository.fetchMovie() else { return }
            self.movies = movieLists
            
            completion()
            
            print("🍔 \n \(movies)")
        }
    }
}

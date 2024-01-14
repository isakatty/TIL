//
//  MovieListViewModelProtocol.swift
//  MovieListApp
//
//  Created by Jisoo HAM on 1/9/24.
//

import Foundation

protocol MovieListViewModelProtocol {
    var movies: [BoxOfficeModel] { get }
}

extension MovieListViewModelProtocol {
    var numberOfMovies: Int { movies.count }
    
    func movieViewModelAtIndex(_ indexPath: IndexPath) -> MovieCellViewModel? {
        let movie = self.movies[indexPath.row]
        return MovieCellViewModel(movie: movie)
    }
}

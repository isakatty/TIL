//
//  MovieListViewModel.swift
//  MovieList
//
//  Created by Jisoo HAM on 1/4/24.
//

import UIKit

class MovieListViewModel {
    let dataManager: MovieListType
    
    private var movieList: [Movie] {
        return dataManager.getMovieList()
    }
    
    init(dataManager: MovieListType) {
        self.dataManager = dataManager
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.movieList.count
    }
    
    func movieViewModelAtIndex(_ index: Int) -> MovieViewModel {
        let movie = self.movieList[index]
        return MovieViewModel(dataManager: self.dataManager, movie: movie)
    }
    
    func handleNextVC(_ index: Int? = nil, fromCurrentVC: UIViewController, animated: Bool) {
        
    }
    
//    private func goToNextVC(with movieVM: MovieViewModel, fromCurrentVC: UIViewController, animated: Bool) {
//                
//        let navVC = fromCurrentVC.navigationController
//        
//        let detailVC = DetailViewController(viewModel: movieVM)
//        navVC?.pushViewController(detailVC, animated: animated)
//    }
}




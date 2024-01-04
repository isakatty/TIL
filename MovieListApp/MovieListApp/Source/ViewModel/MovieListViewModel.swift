//
//  MovieListViewModel.swift
//  MovieListApp
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
    
    var numberOfSections: Int {
        return 1
    }
    
    func movieViewModelAtIndex(_ index: Int) -> MovieViewModel {
        let movie = self.movieList[index]
        return MovieViewModel(dataManager: self.dataManager as! MovieListManager, movie: movie, index: index)
    }
    
    func handleNextVC(_ index: Int? = nil, fromCurrentVC: UIViewController, animated: Bool) {
        // 기존의 멤버가 있을때
        if let index = index {
            let movieVM = movieViewModelAtIndex(index)
            let navVC = fromCurrentVC.navigationController
            
            let detailVC = DetailViewController(viewModel: movieVM)
            navVC?.pushViewController(detailVC, animated: animated)
        }
    }
}

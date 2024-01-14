//
//  MovieListMainCoordinator.swift
//  MovieListApp
//
//  Created by Jisoo HAM on 1/14/24.
//

import UIKit

final class MovieListMainCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator]
    var naviagationController: UINavigationController
    var viewModel: DailyBoxOfficeListViewModel
    
    init(parentCoordinator: Coordinator? = nil,
         childCoordinators: [Coordinator] = [],
         naviagationController: UINavigationController,
         viewModel: DailyBoxOfficeListViewModel) {
        self.parentCoordinator = parentCoordinator
        self.childCoordinators = childCoordinators
        self.naviagationController = naviagationController
        self.viewModel = viewModel
    }
    
    func start() {
        let movieListViewController = MovieListViewController(coordinator: self, movieListViewModel: viewModel)
        
        movieListViewController.coordinator = self
        naviagationController.pushViewController(movieListViewController, animated: true)
    }
    
}

extension MovieListMainCoordinator {
    func showMovieDetail(movieModel: BoxOfficeModel) {
        let movieDetailCoordinator = MovieDetailCoordinator(parentCoordinator: self,
                                                            naviagationController: naviagationController, 
                                                            viewModel: MovieCellViewModel(movie: movieModel))
        childCoordinators.append(movieDetailCoordinator)
        movieDetailCoordinator.start()
    }
}

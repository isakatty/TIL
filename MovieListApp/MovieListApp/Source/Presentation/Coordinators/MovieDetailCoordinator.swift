//
//  MovieDetailCoordinator.swift
//  MovieListApp
//
//  Created by Jisoo HAM on 1/15/24.
//

import UIKit

final class MovieDetailCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator]
    var naviagationController: UINavigationController
    var viewModel: MovieCellViewModel?
    
    init(parentCoordinator: Coordinator? = nil, 
         childCoordinators: [Coordinator] = [],
         naviagationController: UINavigationController,
         viewModel: MovieCellViewModel) {
        self.parentCoordinator = parentCoordinator
        self.childCoordinators = childCoordinators
        self.naviagationController = naviagationController
        self.viewModel = viewModel
    }
    
    func start() {
        guard let viewModel = viewModel else { return }
        let detailViewController = DetailViewController(coordinator: self, viewModel: viewModel)
        naviagationController.pushViewController(detailViewController, animated: true)
    }
    
}

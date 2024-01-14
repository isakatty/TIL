//
//  Coordinator.swift
//  MovieListApp
//
//  Created by Jisoo HAM on 1/14/24.
//

import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var naviagationController: UINavigationController { get set }
    
    func start()
    func childDidFinish(_ child: Coordinator?)
}

extension Coordinator {
    func childDidFinish(_ child: Coordinator?) {
        childCoordinators = childCoordinators.filter { $0 !== child }
    }
}

final class MainCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var naviagationController: UINavigationController
    
    let environment = AppEnvironment()
    
    init(navigationController: UINavigationController) {
        self.naviagationController = navigationController
    }
    
    func start() {
        let movieListCoordinator = MovieListMainCoordinator(parentCoordinator: self,
                                                            naviagationController: naviagationController,
                                                            viewModel: DailyBoxOfficeListViewModel(movieRemoteRepository: environment.movieRemoteRepository as! MovieAPIRepository))
        childCoordinators.append(movieListCoordinator)
        childCoordinators.first?.start()
    }
}


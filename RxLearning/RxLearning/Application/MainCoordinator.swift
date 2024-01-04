//
//  MainCoordinator.swift
//  RxLearning
//
//  Created by Jisoo HAM on 1/4/24.
//

import UIKit

final class MainCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // 
    func start() {
        
    }
    
}

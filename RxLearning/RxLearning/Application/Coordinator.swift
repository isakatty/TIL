//
//  Coordinator.swift
//  RxLearning
//
//  Created by Jisoo HAM on 1/4/24.
//

import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set}
    var childCoordinators: [Coordinator] { get set}
    var navigationController: UINavigationController { get set}
    
    func start()
    func childDidFinish(_ child: Coordinator?)
}

extension Coordinator {
    func childDidFinish(_ child: Coordinator?) {
        childCoordinators = childCoordinators.filter { $0 !== child }
    }
}

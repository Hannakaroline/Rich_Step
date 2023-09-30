//
//  HomeCoordinator.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

class HomeCoordinator: CoordinatorProtocol, HomeControllerDelegateProtocol {

    // MARK: Public properties
    weak var childDelegate: ChildCoordinatorDelegate?
    var childCoordinator: CoordinatorProtocol?
    var containerViewController: UIViewController {
        navigationController
    }

    // MARK: Private properties
    private var navigationController = UINavigationController()

    // MARK: Start
    func start() -> UIViewController {
        let home = HomeFactory.home(delegate: self)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.setViewControllers([home], animated: true)
        return navigationController
    }
}

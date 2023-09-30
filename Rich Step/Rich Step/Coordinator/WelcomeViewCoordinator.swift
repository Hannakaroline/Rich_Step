//
//  WelcomeViewCoordinator.swift
//  Rich Step
//
//  Created by Hanna on 29/09/23.
//

import UIKit

class WelcomeViewCoordinator: CoordinatorProtocol, SpendingListControllerDelegateProtocol {

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
        let welcomeViewController = WelcomeViewFactory.welcomeView(delegate: self)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.setViewControllers([welcomeViewController], animated: true)
        return navigationController
    }
}

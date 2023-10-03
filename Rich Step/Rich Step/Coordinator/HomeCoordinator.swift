//
//  HomeCoordinator.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

class HomeCoordinator: CoordinatorProtocol {

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
        let home = HomeFactory.home(coordinator: self)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.setViewControllers([home], animated: true)
        return navigationController
    }
}

extension HomeCoordinator: SpendControllerDelegate {
    
    func goToDetails(monthlySpending: MonthlySpending) {
        let detailsVC = HomeFactory.spendDetails(coordinator: self, delegate: self)
        navigationController.pushViewController(detailsVC, animated: true)
    }
}

extension HomeCoordinator: UpdateSpendControllerDelegate {
    func goToUpdateSpend(){
        let updateSpendVC = HomeFactory.updateSpend(delegate: self)
        navigationController.pushViewController(updateSpendVC, animated: true)
    }
}

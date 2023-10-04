//
//  HomeCoordinator.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

class HomeCoordinator: CoordinatorProtocol  {
    
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
        let home = HomeFactory.home(coordinator: self, delegate: self)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.setViewControllers([home], animated: true)
        return navigationController
    }
}

extension HomeCoordinator: SpendControllerDelegate {
    
    func goToDetails(monthlySpending: MonthlySpending) {
        let detailsVC = HomeFactory.spendDetails(coordinator: self, delegate: self, monthlySpending: monthlySpending)
        navigationController.pushViewController(detailsVC, animated: true)
    }
}
extension HomeCoordinator: UpdateSpendControllerDelegate {
    
    func goToUpdateSpend(spending: Spending){
        let updateSpendVC = HomeFactory.updateSpend(delegate: self, spending: spending)
        navigationController.pushViewController(updateSpendVC, animated: true)
    }
}

extension HomeCoordinator: HomeControllerDelegate, AddSpendControllerDelegate {
    func goToHome() {
        
    }
    
    
    func goToAddSpend() {
        let addSpendVC = HomeFactory.addSpend(delegate: self)
        navigationController.pushViewController(addSpendVC, animated: true)
    }
}

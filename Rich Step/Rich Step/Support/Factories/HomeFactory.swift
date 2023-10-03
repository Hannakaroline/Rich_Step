//
//  HomeFactory.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

class HomeFactory {
    static func home(coordinator: HomeCoordinator) -> UIViewController {
        let viewModel = HomeViewModel(homeCoordinator: coordinator)
        return HomeController(viewModel: viewModel)
    }
    
    static func spendDetails(coordinator: HomeCoordinator, delegate: SpendControllerDelegate?, monthlySpending: MonthlySpending) -> UIViewController {
        let detailsViewModel = SpendDetailsViewModel(homeCoordinator: coordinator, monthlySpending: monthlySpending)
        return SpendDetailsController(viewModel: detailsViewModel, delegate: delegate)
    }
    
    static func updateSpend(delegate: UpdateSpendControllerDelegate?) -> UIViewController {
        let updateSpendViewModel = UpdateSpendViewModel()
        return UpdateSpendController(viewModel: updateSpendViewModel, delegate: delegate)
    }
}

//
//  HomeFactory.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

class HomeFactory {
    static func home(coordinator: HomeCoordinator, delegate: HomeControllerDelegate) -> UIViewController {
        let viewModel = HomeViewModel(homeCoordinator: coordinator)

        return HomeController(viewModel: viewModel, delegate: delegate)
    }
    
    static func spendDetails(coordinator: HomeCoordinator, delegate: SpendControllerDelegate?, monthlySpending: MonthlySpending) -> UIViewController {
        let detailsViewModel = SpendDetailsViewModel(homeCoordinator: coordinator, monthlySpending: monthlySpending)
        return SpendDetailsController(viewModel: detailsViewModel, delegate: delegate)
    }
    
    static func updateSpend(delegate: UpdateSpendControllerDelegate?, spending: Spending) -> UIViewController {
        let updateSpendViewModel = UpdateSpendViewModel(spending: spending)
        return UpdateSpendController(viewModel: updateSpendViewModel, delegate: delegate)
    }
    
    static func addSpend(delegate: AddSpendControllerDelegate?) -> UIViewController {
        let addSpendViewModel = AddSpendViewModel()
        return AddSpendController(viewModel: addSpendViewModel, delegate: delegate)
    }
}

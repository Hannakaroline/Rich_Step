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
    
    static func spendDetails(delegate: SpendControllerDelegate?) -> UIViewController {
        let detailsViewModel = SpendDetailsViewModel()
        return SpendDetailsController(viewModel: detailsViewModel, delegate: delegate)
    }
}

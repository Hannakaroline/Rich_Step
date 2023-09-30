//
//  HomeFactory.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

class HomeFactory {
    static func home(delegate: HomeControllerDelegateProtocol?) -> UIViewController {
        let viewModel = HomeViewModel()
        return HomeController(viewModel: viewModel, delegate: delegate)
    }
}

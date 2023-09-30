//
//  WelcomeViewFactory.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

class WelcomeViewFactory {
    static func welcomeView(delegate: welcomeViewDelegateProtocol?) -> UIViewController {
        let viewModel = WelcomeViewModel()
        return WelcomeViewController(viewModel: viewModel, delegate: delegate)
    }
}

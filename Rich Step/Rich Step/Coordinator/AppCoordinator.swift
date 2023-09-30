//
//  AppCoordinator.swift
//  Rich Step
//
//  Created by Hanna on 29/09/23.
//

import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    private(set) var childCoordinator: CoordinatorProtocol?
    
    // MARK: - Init
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        window.rootViewController = coordinatorDefault()
        window.makeKeyAndVisible()
    }
    
    private func coordinatorDefault() -> UIViewController {
    let welcomeCoordinator = WelcomeViewCoordinator()
        childCoordinator = welcomeCoordinator
        return welcomeCoordinator.start()
    }
}

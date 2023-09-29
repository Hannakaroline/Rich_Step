//
//  CoordinatorProtocol.swift
//  Rich Step
//
//  Created by Hanna on 29/09/23.
//

import UIKit

// MARK: - CoordinatorProtocol
protocol CoordinatorProtocol: ChildCoordinatorDelegate {
    var childDelegate: ChildCoordinatorDelegate? { get set }
    var childCoordinator: CoordinatorProtocol? { get set }
    var containerViewController: UIViewController { get }
}

// MARK: - ChildCoordinatorDelegate
protocol ChildCoordinatorDelegate: AnyObject {
    func didStartDismiss()
    func finishedFlow()
}

extension ChildCoordinatorDelegate {
    func didStartDismiss() { }
}

extension ChildCoordinatorDelegate where Self: CoordinatorProtocol {

    func finishedFlow() {
        childCoordinator = nil
    }
}

// MARK: - DimissibleCoordinator
protocol DismissibleCoordinator {
    func dismiss(animated: Bool)
}

extension DismissibleCoordinator where Self: CoordinatorProtocol {

    func dismiss(animated: Bool = true) {
        childDelegate?.didStartDismiss()
        containerViewController.dismiss(animated: animated) { [weak self] in
            self?.childDelegate?.finishedFlow()
        }
    }
}

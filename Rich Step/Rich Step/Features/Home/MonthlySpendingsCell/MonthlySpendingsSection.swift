//
//  MonthlySpendingsSection.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

protocol MonthlySpendingDelegateProtocol: AnyObject {
    func goToDetails()
}

class MonthlySpendingsSection: TableSectionProtocol, SpendControllerDelegate {
    
    // MARK: - Private properties
    private let viewModels: [MonthlySpendingViewModel]
    var homeCoordinator: HomeCoordinator

    init(viewModels: [MonthlySpendingViewModel], homeCoordinator: HomeCoordinator) {
        self.viewModels = viewModels
        self.homeCoordinator = homeCoordinator
    }
    
    var itemsCount: Int {
        viewModels.count
    }
    
    func cellType() -> UITableViewCell.Type {
        MonthlySpendingsCell.self
    }
    
    func rowheight() -> CGFloat? {
        80
    }
    
    func configureCell(cell: UITableViewCell, at row: Int) {
        if let cell = cell as? MonthlySpendingsCell, row < itemsCount {
            cell.bindIn(viewModel: viewModels[row])
        }
    }
    func didSelectAt(row: Int) {
        let vm = viewModels[row]
        homeCoordinator.goToDetails(monthlySpending: vm.monthlySpending)
    }
}

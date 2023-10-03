//
//  DetailsCellSection.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

class DetailsCellSection: TableSectionProtocol, UpdateSpendControllerDelegate {
    
    // MARK: - Private properties
    private let viewModels: [DetailsTableViewCellProtocol]
    var homeCoordinator: HomeCoordinator

    // MARK: - Init
    init(viewModels: [DetailsTableViewCellProtocol], homeCoordinator: HomeCoordinator) {
        self.viewModels = viewModels
        self.homeCoordinator = homeCoordinator
    }
    
    var itemsCount: Int {
        viewModels.count
    }
    
    func cellType() -> UITableViewCell.Type {
        DetailsTableViewCell.self
    }
    
    func rowheight() -> CGFloat? {
        80
    }
    
    func configureCell(cell: UITableViewCell, at row: Int) {
        if let cell = cell as? DetailsTableViewCell, row < itemsCount {
            cell.bindIn(viewModel: viewModels[row])
        }
    }
    
    func didSelectAt(row: Int) {
        let vm = viewModels[row]
        homeCoordinator.goToUpdateSpend()
    }
}

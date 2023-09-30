//
//  HomeCellSection.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

class HomeCellSection: TableSectionProtocol {
    
    private let viewModel: [HomeCellViewModelProtocol]
    
    init(viewModel: [HomeCellViewModelProtocol]) {
        self.viewModel = viewModel
    }
    
    var itemsCount: Int {
        viewModel.count
    }
    
    func cellType() -> UITableViewCell.Type {
        HomeViewCell.self
    }
    
    func rowheight() -> CGFloat? {
        40
    }
    
    func configureCell(cell: UITableViewCell, at row: Int) {
        if let cell = cell as? HomeViewCell, row < itemsCount {
            cell.bindIn(viewModel: viewModel[row])
        }
    }
    
}

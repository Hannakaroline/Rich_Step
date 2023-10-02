//
//  DetailsCellSection.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

class DetailsCellSection: TableSectionProtocol {
    
    // MARK: - Private properties
    private let viewModel: [DetailsTableViewCellProtocol]
    
    init(viewModel: [DetailsTableViewCellProtocol]) {
        self.viewModel = viewModel
    }
    
    var itemsCount: Int {
        viewModel.count
    }
    
    func cellType() -> UITableViewCell.Type {
        DetailsTableViewCell.self
    }
    
    func rowheight() -> CGFloat? {
        80
    }
    
    func configureCell(cell: UITableViewCell, at row: Int) {
        if let cell = cell as? DetailsTableViewCell, row < itemsCount {
            cell.bindIn(viewModel: viewModel[row])
        }
    }
}

//
//  TableSections.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

protocol TableSectionDelegate: AnyObject {
    func didSelect(item: Any)
}

class TableSection<Cell: UITableViewCell & TableViewProtocol>: TableSectionProtocol {
 
    // MARK: - Public propertiess
    var itemsCount: Int {
        return items.count
    }
    
    // MARK: - Private properties
    private var items: [Cell.ViewModel]
    private weak var delegate: TableSectionDelegate?
    
    // MARK: - Init
    init(items: [Cell.ViewModel] = [], delegate: TableSectionDelegate? = nil) {
        self.items = items
        self.delegate = delegate
    }
    
    func cellType() -> UITableViewCell.Type {
        Cell.self
    }
    
    func configureCell(cell: UITableViewCell, at row: Int) {
        if let cell = cell as? Cell, row < itemsCount {
            cell.bindIn(viewModel: items[row])
        }
    }
    
    func rowheight() -> CGFloat? {
        return UITableView.automaticDimension
    }
    
    func didSelectAt(row: Int) {
        guard row < items.count else { return }
        delegate?.didSelect(item: items[row])
    }
    
}


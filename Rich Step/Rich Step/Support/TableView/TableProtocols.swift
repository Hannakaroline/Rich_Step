//
//  TableProtocols.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

protocol TableSectionProtocol {
    var itemsCount: Int { get }
    func cellType() -> UITableViewCell.Type
    func configureCell(cell: UITableViewCell, at row: Int)
    func didSelectAt(row: Int)
    func headerView() -> UIView?
    func headerHeight() -> CGFloat
    func rowheight() -> CGFloat?
}

extension TableSectionProtocol {
    
    func headerView() -> UIView? {
        return nil
    }
    
    func headerHeight() -> CGFloat {
        return 0
    }
    
    func rowheight() -> CGFloat? {
        return 0
    }
    
    func didSelectAt(row: Int) { }
}

protocol TableViewModelProtocol { }

protocol TableViewProtocol {
    associatedtype ViewModel = TableViewModelProtocol
    func bindIn(viewModel: ViewModel)
}

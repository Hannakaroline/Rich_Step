//
//  HomeView.swift
//  Rich Step
//
//  Created by Hanna on 29/09/23.
//

import UIKit

protocol HomeViewModelProtocol {
    var sections: [MonthlySpendingsSection] { get }
    
    func didTapAddButton()
}

class HomeView: UIView {
    
    // MARK: - UI Components
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Private properties
    private var viewModel: HomeViewModelProtocol?
    private var tableViewDataSource = TableViewDataSource()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableViewDataSource.tableView = tableView
    }
    
    // MARK: - Bind
    func bindIn(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        self.tableViewDataSource.sections = viewModel.sections
        self.tableViewDataSource.tableView?.reloadData()
    }
    
    // MARK: - reload data
    func reloadData() {
        self.tableViewDataSource.sections = viewModel?.sections ?? []
        self.tableViewDataSource.tableView?.reloadData()
    }
}

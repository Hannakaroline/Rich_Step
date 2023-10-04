//
//  HomeView.swift
//  Rich Step
//
//  Created by Hanna on 29/09/23.
//

import UIKit

protocol HomeViewModelProtocol {
    var fetchSections: [MonthlySpendingsSection] { get }
}

class HomeView: UIView {
    
    // MARK: - UI Components
    @IBOutlet var title: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Private properties
    private var viewModel: HomeViewModelProtocol?
    private var tableViewDataSource = TableViewDataSource()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    // MARK: - Bind
    func bindIn(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        self.tableViewDataSource.sections = viewModel.fetchSections
    }
}
extension HomeView {
    
    private func setup() {
        tableViewDataSource.tableView = tableView
        title.text = "Spending List"
    }
}

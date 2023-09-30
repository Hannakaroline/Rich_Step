//
//  HomeView.swift
//  Rich Step
//
//  Created by Hanna on 29/09/23.
//

import UIKit

protocol HomeViewModelProtocol {
    var fetchSections: [HomeCellSection] { get }
//    var onFetchSectionsChange: (([TableSectionProtocol]) -> Void)? { get set }

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
        let fetch = viewModel.fetchSections
        self.tableViewDataSource.sections = fetch
    }
}
extension HomeView {
    private func setup() {
        setupTableView()
        tableViewDataSource.tableView = tableView
    }
    
    private func setupTableView() {
        tableView.isScrollEnabled = false
    }
}

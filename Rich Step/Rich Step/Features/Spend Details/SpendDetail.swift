//
//  SpendDetail.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

protocol SpendDetailProtocol {
//    var fetchSection: [] { get }
}

class SpendDetail: UIView {
    
    // MARK: - UI Components
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Private properties
    private var viewModel: SpendDetailProtocol?
    private var tableViewDataSource = TableViewDataSource()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    // MARK: - Bind
    func bind(viewModel: SpendDetailProtocol) {
        self.viewModel = viewModel
//        self.tableViewDataSource.sections = viewModel.fetchSections
    }
}

extension SpendDetail {
    
    private func setup() {
        setupTableView()
        tableViewDataSource.tableView = tableView
    }
    
    private func setupTableView() {
        tableView.isScrollEnabled = false
    }
}

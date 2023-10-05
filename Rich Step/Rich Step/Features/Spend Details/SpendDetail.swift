//
//  SpendDetail.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

protocol SpendDetailProtocol {
    var totalAmount: String? { get }
    var monthOfYear: String { get }
    var sections: [DetailsCellSection] { get }
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
    
    // MARK: - BindIn
    func bindIn(viewModel: SpendDetailProtocol) {
        self.viewModel = viewModel
        self.tableViewDataSource.sections = viewModel.sections
        let formattedAmount = "¥" + viewModel.totalAmount!
        valueLabel.text = formattedAmount
    }
    
    func reloadData() {
        self.tableViewDataSource.sections = viewModel?.sections ?? []
        self.tableViewDataSource.tableView?.reloadData()
        let formattedAmount = "¥" + (viewModel?.totalAmount ?? "0")
        valueLabel.text = formattedAmount
    }
}

extension SpendDetail {
    
    private func setup() {
        tableViewDataSource.tableView = tableView
        titleLabel.text = "Total Amount"
    }
}

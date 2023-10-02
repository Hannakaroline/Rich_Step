//
//  MonthlySpendingsCell.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

protocol MonthlySpendingsCellProtocol {
    var dateLabel: String? { get }
    var valueLabel: String? { get }
    
    func didTapCell()
}

class MonthlySpendingsCell: UITableViewCell {

    // MARK: - UI Components
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var openButton: UIButton!
    
    private var viewModel: MonthlySpendingsCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    func bindIn(viewModel: MonthlySpendingsCellProtocol) {
        self.viewModel = viewModel
        dateLabel.text = viewModel.dateLabel
        valueLabel.text = viewModel.valueLabel
    }
    
    // MARK: - Actions
    @objc func didTapDetails() {
        viewModel?.didTapCell()
    }
}

extension MonthlySpendingsCell {
    func setup() {
        contentView.backgroundColor = .clear
    }
    
    func setupOpenDetailsButton() {
        openButton.addTarget(self, action: #selector(didTapDetails), for: .touchUpInside)
    }
}

//
//  MonthlySpendingsCell.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

protocol MonthlySpendingsCellProtocol {
    var date: String? { get }
    var amount: String? { get }
    
    func didTapCell()
}

class MonthlySpendingsCell: UITableViewCell {

    // MARK: - UI Components
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var openButton: UIButton!
    @IBOutlet weak var cardView: UIView!
    
    // MARK: - Private properties
    private var viewModel: MonthlySpendingsCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    func bindIn(viewModel: MonthlySpendingsCellProtocol) {
        self.viewModel = viewModel
        dateLabel.text = viewModel.date
        let formattedAmount = "¥" + viewModel.amount!
        valueLabel.text = formattedAmount
    }
    
    // MARK: - Actions
    @objc func didTapDetails() {
        viewModel?.didTapCell()
    }
}

extension MonthlySpendingsCell {
    func setup() {
        cardView.backgroundColor = .clear
    }
    
    func setupOpenDetailsButton() {
        openButton.addTarget(self, action: #selector(didTapDetails), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0))
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 1.0
        contentView.layer.cornerRadius = 8
    }
}

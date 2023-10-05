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
}

class MonthlySpendingsCell: UITableViewCell {

    // MARK: - UI Components
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
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
}

extension MonthlySpendingsCell {
    func setup() {
        cardView.backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cardView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0))
        cardView.layer.borderColor = UIColor.gray.cgColor
        cardView.layer.borderWidth = 1.0
        cardView.layer.cornerRadius = 8
    }
}

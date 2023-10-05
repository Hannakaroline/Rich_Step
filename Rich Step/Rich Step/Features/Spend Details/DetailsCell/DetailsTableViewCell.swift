//
//  DetailsTableViewCell.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

protocol DetailsTableViewCellProtocol {
    var description: String { get }
    var date: String { get }
    var amount: String { get }
}

class DetailsTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    
    // MARK: - Private properties
    var viewModel: DetailsTableViewCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func bindIn(viewModel: DetailsTableViewCellProtocol) {
        self.viewModel = viewModel
        nameLabel.text = viewModel.description
        dateLabel.text = viewModel.date
        let formattedAmount = "¥" + viewModel.amount
        valueLabel.text = formattedAmount
    }
    
}

extension DetailsTableViewCell {
    
    func setup() {
        contentView.backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 4, bottom: 16, right: 4))
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 1.0
        contentView.layer.cornerRadius = 8
    }
}

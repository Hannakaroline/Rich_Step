//
//  DetailsTableViewCell.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

protocol DetailsTableViewCellProtocol {
    var nameLabel: String? { get }
    var dateLabel: String? { get }
    var valueLabel: String? { get }
}

class DetailsTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var openButton: UIButton!
    
    // MARK: - Private properties
    var viewModel: DetailsTableViewCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func bindIn(viewModel: DetailsTableViewCellProtocol) {
        self.viewModel = viewModel
        nameLabel.text = viewModel.nameLabel
        dateLabel.text = viewModel.dateLabel
        valueLabel.text = viewModel.valueLabel
    }
    
}

extension DetailsTableViewCell {
    
    func setup() {
        contentView.backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0))
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 1.0
        contentView.layer.cornerRadius = 8
    }
}

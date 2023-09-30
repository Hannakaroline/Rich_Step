//
//  HomeViewCell.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

protocol HomeCellViewModelProtocol{
    var dateLabel: String? { get }
    var valueLabel: String? { get }
}

class HomeViewCell: UITableViewCell {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    var viewModel: HomeCellViewModelProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    func bindIn(viewModel: HomeCellViewModelProtocol) {
        self.viewModel = viewModel
        dateLabel.text = viewModel.dateLabel
        valueLabel.text = viewModel.valueLabel
    }
}

extension HomeViewCell {
    func setup() {
        contentView.backgroundColor = .clear
    }
}

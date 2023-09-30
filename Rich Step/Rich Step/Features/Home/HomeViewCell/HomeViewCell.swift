//
//  HomeViewCell.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

protocol HomeCellProtocol {
    var dateLabel: String? { get }
    var valueLabel: String? { get }
    
    func didTapDetails()
}

class HomeViewCell: UITableViewCell {

    // MARK: - UI Components
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var openButton: UIButton!
    
    private var viewModel: HomeCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    func bindIn(viewModel: HomeCellProtocol) {
        self.viewModel = viewModel
        dateLabel.text = viewModel.dateLabel
        valueLabel.text = viewModel.valueLabel
    }
    
    // MARK: - Actions
    @objc func didTapDetails() {
        viewModel?.didTapDetails()
    }
    
    func setupOpenDetailsButton() {
        openButton.addTarget(self, action: #selector(didTapDetails), for: .touchUpInside)
    }
}

extension HomeViewCell {
    func setup() {
        contentView.backgroundColor = .clear
    }
}

//
//  UpdateSpend.swift
//  Rich Step
//
//  Created by Hanna on 02/10/23.
//

import UIKit

protocol UpdateSpendViewModelProtocol {
    func didUpdate()
}

class UpdateSpend: UIView {
    
    // MARK: - UI Components
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var itemLabel: UILabel!
    @IBOutlet private weak var itemTextField: UITextField!
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var amountTextField: UITextField!
    @IBOutlet private weak var updateButton: UIButton!
    
    // MARK: - Private properties
    private var viewModel: UpdateSpendViewModelProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    //  MARK: - BindIn
    func bindIn(viewModel: UpdateSpendViewModelProtocol) {
        self.viewModel = viewModel
    }
}

extension UpdateSpend {
    
    private func setup() {
        dateLabel.text = "Date"
        itemLabel.text = "Item"
        amountLabel.text = "Amount"
    }
}

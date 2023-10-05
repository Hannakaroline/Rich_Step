//
//  addSpend.swift
//  Rich Step
//
//  Created by Hanna on 04/10/23.
//

import UIKit

protocol AddSpendViewModelProtocol {
    var onSaved: (() -> Void)? { get }
    func didTapAddButton(_ itemDesc: String, _ amount: Float, _ date: Date)
}

class AddSpend: UIView {
    
    // MARK: - UI Components
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet private weak var itemDescriptionTextField: UITextField!
    @IBOutlet private weak var amountTextField: UITextField!
    @IBOutlet private weak var addButton: UIButton!
    
    // MARK: - Private properties
    private var viewModel: AddSpendViewModelProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupButton()
    }
    
    //  MARK: - BindIn
    func bindIn(viewModel: AddSpendViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Actions
    @objc func didTapAddButton() {
        let desc = itemDescriptionTextField.text ?? ""
        let amount = amountTextField.text ?? "0.0"
        let date = datePicker.date
        
        viewModel?.didTapAddButton(desc, NSString(string: amount).floatValue, date)
    }
    
    func setupButton() {
        addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
    }
}

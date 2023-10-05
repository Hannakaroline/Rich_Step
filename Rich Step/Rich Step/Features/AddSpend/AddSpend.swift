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
    @IBOutlet private weak var dateTextField: UITextField!
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
        let desc = itemDescriptionTextField.text ?? "Without Description"
        let amount = amountTextField.text ?? "0.0"
        let date = Util.instance.parseDate(date: dateTextField.text ?? "")
        
        viewModel?.didTapAddButton(desc, NSString(string: amount).floatValue, date)
    }
    
    @objc func dateChange(datePicker: UIDatePicker) {
        dateTextField.text = Util.instance.format(date: datePicker.date)
    }
}
extension AddSpend {
    
    func setupButton() {
        addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChange), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        dateTextField.inputView = datePicker
    }
}

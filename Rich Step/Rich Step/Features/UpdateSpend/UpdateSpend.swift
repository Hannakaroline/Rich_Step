//
//  UpdateSpend.swift
//  Rich Step
//
//  Created by Hanna on 02/10/23.
//

import UIKit

protocol UpdateSpendViewModelProtocol {
    var date: Date { get }
    var amount: Float { get }
    var onUpdated: (() -> Void)? { get }
    var desc: String { get }
    
    func didTapUpdateButton(_ date: Date ,_ itemDesc: String, _ amount: Float)
}

class UpdateSpend: UIView {
    
    // MARK: - UI Components
    @IBOutlet private weak var dateTextField: UITextField!
    @IBOutlet private weak var itemDescriptionTextField: UITextField!
    @IBOutlet private weak var amountTextField: UITextField!
    @IBOutlet private weak var updateButton: UIButton!
    
    // MARK: - Private properties
    private var viewModel: UpdateSpendViewModelProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //  MARK: - BindIn
    func bindIn(viewModel: UpdateSpendViewModelProtocol) {
        self.viewModel = viewModel
        setup()
        itemDescriptionTextField.text = viewModel.desc
        amountTextField.text = "\(viewModel.amount)"
        dateTextField.text = Util.instance.format(date: viewModel.date)
    }
    
    @objc func didTapUpdateButton() {
        let desc = itemDescriptionTextField.text ?? ""
        let amount = amountTextField.text ?? "0.0"
        let date = Util.instance.parseDate(date: dateTextField.text ?? "")
        
        viewModel?.didTapUpdateButton(date, desc, NSString(string: amount).floatValue)
    }

    @objc func dateChange(datePicker: UIDatePicker) {
        dateTextField.text = Util.instance.format(date: datePicker.date)
    }
}

extension UpdateSpend {
    
    private func setup() {
        updateButton.addTarget(self, action: #selector(didTapUpdateButton), for: .touchUpInside)
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.date = viewModel?.date ?? Date.now
        datePicker.addTarget(self, action: #selector(dateChange), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        dateTextField.inputView = datePicker
    }
    
}

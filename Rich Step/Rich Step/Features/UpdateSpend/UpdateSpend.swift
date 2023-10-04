//
//  UpdateSpend.swift
//  Rich Step
//
//  Created by Hanna on 02/10/23.
//

import UIKit

protocol UpdateSpendViewModelProtocol {
    var date: String { get }
    var amount: Float { get }
    var itemDescription: String? { get }

    func didTapUpdate()
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
        setup()
    }
    
    //  MARK: - BindIn
    func bindIn(viewModel: UpdateSpendViewModelProtocol) {
        self.viewModel = viewModel
        dateTextField.text = viewModel.date
        itemDescriptionTextField.text = viewModel.itemDescription
        amountTextField.text = String(viewModel.amount)
    }
    
    @objc func didTapUpdate() {
        viewModel?.didTapUpdate()
    }
}

extension UpdateSpend {
    
    private func setup() {
        dateTextField.isEnabled = false
        setupButton()
    }
    
    private func setupButton() {
        updateButton.addTarget(self, action: #selector(didTapUpdate), for: .touchUpInside)
    }
}

//
//  UpdateSpend.swift
//  Rich Step
//
//  Created by Hanna on 02/10/23.
//

import UIKit

protocol UpdateSpendViewModelProtocol {
    var onUpdated: (() -> Void)? { get }
    
    func didTapUpdate(_ itemDesc: String, _ amount: Float)
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
    }
    
    @objc func didTapUpdate() {
        let desc = itemDescriptionTextField.text ?? ""
        let amount = amountTextField.text ?? "0.0"
        
        viewModel?.didTapUpdate(desc, NSString(string: amount).floatValue)
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

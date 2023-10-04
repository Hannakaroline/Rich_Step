//
//  addSpend.swift
//  Rich Step
//
//  Created by Hanna on 04/10/23.
//

import UIKit
protocol addSpendProtocol {
    func didTapAddButton()
}

class AddSpend: UIView {
    
    // MARK: - UI Components
    @IBOutlet private weak var dateTextField: UITextField!
    @IBOutlet private weak var itemDescriptionTextField: UITextField!
    @IBOutlet private weak var amountTextField: UITextField!
    @IBOutlet private weak var addButton: UIButton!
    
    // MARK: - Private properties
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //  MARK: - BindIn
    func bindIn() { }
}

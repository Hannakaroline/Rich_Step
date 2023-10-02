//
//  AddSpend.swift
//  Rich Step
//
//  Created by Hanna on 02/10/23.
//

import UIKit

class AddSpend: UIView {
    
    // MARK: - UI Components
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var itemLabel: UILabel!
    @IBOutlet private weak var itemTextField: UITextField!
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var button: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

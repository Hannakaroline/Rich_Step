//
//  SpendingView.swift
//  Rich Step
//
//  Created by Hanna on 29/09/23.
//

import UIKit

class SpendingView: UIView {
    
    // MARK: - UI Components
    @IBOutlet var label: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        label.text = "start"
    }
}

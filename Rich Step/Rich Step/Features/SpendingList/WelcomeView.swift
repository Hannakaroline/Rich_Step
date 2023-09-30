//
//  SpendingView.swift
//  Rich Step
//
//  Created by Hanna on 29/09/23.
//

import UIKit

class WelcomeView: UIView {
    
    // MARK: - UI Components
    @IBOutlet var button: UIButton!
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.textColor = .red
        titleLabel.text = "For your dream"
        button.tintColor = .blue
    }
}


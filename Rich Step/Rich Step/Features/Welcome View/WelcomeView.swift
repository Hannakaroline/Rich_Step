//
//  SpendingView.swift
//  Rich Step
//
//  Created by Hanna on 29/09/23.
//

import UIKit
protocol welcomeProtocol {
    func didTapStartButton()
}
class WelcomeView: UIView {
    
    // MARK: - UI Components
    @IBOutlet var startButton: UIButton!
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Private properties
    private var viewModel: welcomeProtocol?
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.textColor = .red
        titleLabel.text = "For your dream"
        setupStartButton()
    }
    
    func bindIn(viewModel: welcomeProtocol) {
        self.viewModel = viewModel
    }
    
    // MARK: - Actions
    @objc func didTapStartButton() {
        viewModel?.didTapStartButton()
    }
    
    func setupStartButton() {
        startButton.tintColor = .blue
        startButton.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
    }
}



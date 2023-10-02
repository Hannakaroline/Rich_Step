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

    
    // MARK: - Private properties
    private var viewModel: welcomeProtocol?
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStartButton()
    }
    
    func bindIn(viewModel: welcomeProtocol) {
        self.viewModel = viewModel
    }
    
    // MARK: - Actions
    @objc func didTapStartButton() {
        viewModel?.didTapStartButton()
    }
    
    func setupStartButton(){
        startButton.backgroundColor = UIColor(red: 23, green: 142, blue: 212, alpha: 1.0)
        startButton.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
    }
}

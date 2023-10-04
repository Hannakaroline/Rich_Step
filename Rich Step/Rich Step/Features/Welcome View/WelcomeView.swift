//
//  WelcomeView.swift
//  Rich Step
//
//  Created by Hanna on 29/09/23.
//

import UIKit

protocol WelcomeViewModelProtocol {
    func didTapStartButton()
}
class WelcomeView: UIView {
    
    // MARK: - UI Components
    @IBOutlet var startButton: UIButton!
    @IBOutlet var logoImage: UIImageView!

    
    // MARK: - Private properties
    private var viewModel: WelcomeViewModelProtocol?
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStartButton()
    }
    
    func bindIn(viewModel: WelcomeViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    // MARK: - Actions
    @objc func didTapStartButton() {
        viewModel?.didTapStartButton()
    }
    
    func setupStartButton(){
        startButton.backgroundColor = UIColor.blue
        startButton.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
    }
}

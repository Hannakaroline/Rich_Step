//
//  WelcomeViewModel.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import Foundation

protocol WelcomeViewProtocol: WelcomeViewModelProtocol {
    var onTapStartButton: (() -> Void)? { get set }
}

class WelcomeViewModel: WelcomeViewProtocol {
    var titleLabel: String = ""
    
    var onTapStartButton: (() -> Void)? 
    
    func didTapStartButton() {
        onTapStartButton?()
    }
}

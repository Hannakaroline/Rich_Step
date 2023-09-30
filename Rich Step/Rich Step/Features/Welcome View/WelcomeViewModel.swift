//
//  WelcomeViewModel.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import Foundation

protocol WelcomeViewModelProtocol: welcomeProtocol {
    var onTapStartButton: (() -> Void)? { get set }
}

class WelcomeViewModel: WelcomeViewModelProtocol {
    var onTapStartButton: (() -> Void)? 
    
    func didTapStartButton() {
        onTapStartButton?()
    }
}

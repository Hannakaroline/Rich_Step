//
//  UpdateSpendViewModel.swift
//  Rich Step
//
//  Created by Hanna on 02/10/23.
//

import Foundation
protocol UpdateSpendProtocol: UpdateSpendViewModelProtocol {
    var onTapUpdateAmount: (() -> Void)? { get set }
}

class UpdateSpendViewModel: UpdateSpendProtocol {

    // MARK: - Public properties
    var onTapUpdateAmount: (() -> Void)?
    
    func didUpdate() {
        onTapUpdateAmount?()
    }
}

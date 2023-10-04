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
    var spending: Spending
    
    init(spending: Spending) {
        self.spending = spending
    }
    
    var date: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter.string(from: spending.date)
    }
    
    var itemDescription: String? {
        return spending.description
    }
    
    var amount: Float {
        return spending.amount
    }
    
    func didTapUpdate() {
        onTapUpdateAmount?()
    }
}

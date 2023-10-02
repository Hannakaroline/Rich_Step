//
//  MonthlySpendingViewModel.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import Foundation

protocol MonthlySpendingsCellViewModel: MonthlySpendingsCellProtocol {
    var onTapDetailsButton: (() -> Void)? { get set }
}

class MonthlySpendingViewModel: MonthlySpendingsCellViewModel {
    
    // MARK: - Public properties
    var monthlySpending: MonthlySpending
    var onTapDetailsButton: (() -> Void)?
    let dateFormatter = DateFormatter()
    var dateLabel: String? {
        return "\(monthlySpending.monthOfYear.year)/\(monthlySpending.monthOfYear.month)"
    }
    
    var valueLabel: String? {
        let value = monthlySpending.spendings.reduce(0, { $0 + $1.amount})
        return String(value)
    }
    // MARK: - Init
    init(monthlySpending: MonthlySpending) {
        self.monthlySpending = monthlySpending
    }
    
    func didTapCell() {
        onTapDetailsButton?()
    }
}

//
//  SpendingDetailsViewModel.swift
//  Rich Step
//
//  Created by Hanna on 01/10/23.
//

import Foundation
protocol DetailsViewModelProtocol: SpendDetailProtocol { }

class SpendDetailsViewModel: DetailsViewModelProtocol {
    
    // MARK: - Public properties
    var fetchSections: [DetailsCellSection] {
        [detailsSection()]
    }
    let formatter = DateFormatter()
    let homeCoordinator: HomeCoordinator
    let monthlySpending: MonthlySpending
    
    var totalAmount: String? {
        let value = monthlySpending.spendings.reduce(0, { $0 + $1.amount})
        return String(value)
    }
    
    // MARK: - Init
    init(homeCoordinator: HomeCoordinator, monthlySpending: MonthlySpending) {
        self.homeCoordinator = homeCoordinator
        self.monthlySpending = monthlySpending
    }
    
    private func detailsSection() -> DetailsCellSection {

        DetailsCellSection(
            viewModels: monthlySpending.spendings.map {
                DetailsCellViewModel(spending: $0)
            }, homeCoordinator: homeCoordinator)
    }
}

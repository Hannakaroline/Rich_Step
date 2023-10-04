//
//  HomeViewModel.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import Foundation

protocol HomeViewProtocol: HomeViewModelProtocol {
    var onTapAddButton: (() -> Void)? { get set }
}

class HomeViewModel: HomeViewProtocol {

    // MARK: - Public properties
    var onTapAddButton: (() -> Void)?
    var sections: [MonthlySpendingsSection] {
        [spending()]
    }
    let formatter = DateFormatter()
    let homeCoordinator: HomeCoordinator
    
    // MARK: - Init
    init(homeCoordinator: HomeCoordinator){
        self.homeCoordinator = homeCoordinator
        formatter.dateFormat = "yyyy/MM/dd"
    }
    
    func didTapAddButton() {
        onTapAddButton?()
    }
    
    func mapMonthOfYear(date: Date) -> MonthOfYear {
        let components = Calendar.current.dateComponents([.month, .year], from: date)
        return MonthOfYear(month: components.month!, year: components.year!)
    }
    
    func parseMonth(_ date: String) -> Date? {
        return formatter.date(from: date)
    }
    
    func spending() -> MonthlySpendingsSection  {
        let spendings = SpendingsRepository.instance.getSpendings()
        
        let spendingsByMonth = Dictionary(
            grouping: spendings,
            by: { mapMonthOfYear(date: $0.date)})
        
        let viewModels = spendingsByMonth.map {
            MonthlySpendingViewModel(
                monthlySpending: MonthlySpending(monthOfYear: $0, spendings: $1)
            )
        }
        
        return MonthlySpendingsSection(
            viewModels: viewModels,
            homeCoordinator: homeCoordinator
        )
    }
}

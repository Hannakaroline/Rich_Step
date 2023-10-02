//
//  HomeViewModel.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import Foundation

class HomeViewModel: HomeViewModelProtocol {
    
    let formatter = DateFormatter()
    let homeCoordinator: HomeCoordinator
    // MARK: - Init
    init(homeCoordinator: HomeCoordinator){
        self.homeCoordinator = homeCoordinator
        formatter.dateFormat = "yyyy/MM/dd"
    }
    
    // MARK: - Public properties
    var fetchSections: [MonthlySpendingsSection] {
        [spending()]
    }
    
    func mapMonthOfYear(date: Date) -> MonthOfYear {
        let components = Calendar.current.dateComponents([.month, .year], from: date)
        return MonthOfYear(month: components.month!, year: components.year!)
    }
    
    func parseMonth(_ date: String) -> Date? {
        return formatter.date(from: date)
    }
    
    func spending() -> MonthlySpendingsSection  {
        let spendings = [
            Spending(date: parseMonth("2023/08/01")!, description: "Shopping", amount: 100),
            Spending(date: parseMonth("2023/08/01")!, description: "Wifi", amount: 100),
            Spending(date: parseMonth("2023/07/01")!, description: "Shopping", amount: 100),
            Spending(date: parseMonth("2023/07/01")!, description: "Wifi", amount: 100),
            Spending(date: parseMonth("2023/06/01")!, description: "Shopping", amount: 100),
            Spending(date: parseMonth("2023/06/01")!, description: "Wifi", amount: 100),
            Spending(date: parseMonth("2023/05/01")!, description: "Shopping", amount: 100),
            Spending(date: parseMonth("2023/05/01")!, description: "Wifi", amount: 100),
        ]
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

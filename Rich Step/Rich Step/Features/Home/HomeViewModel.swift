//
//  HomeViewModel.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import Foundation
import UIKit

protocol HomeViewProtocol: HomeViewModelProtocol {
    var onTapAddButton: (() -> Void)? { get set }
}

class HomeViewModel: HomeViewProtocol {
    var onFetchSectionsChange: (([MonthlySpendingsSection]) -> Void)?

    // MARK: - Public properties
    var onTapAddButton: (() -> Void)?
    var sections: [MonthlySpendingsSection] {
        [getAllSpendings()]
    }
    let formatter = DateFormatter()
    let homeCoordinator: HomeCoordinator
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
    
    func getAllSpendings() -> MonthlySpendingsSection {
        do {
            let spendings = try context.fetch(Spending.fetchRequest())
            let spendingsByMonth = Dictionary(
                grouping: spendings,
                by: { mapMonthOfYear(date: $0.date ?? Date.now)})
            
            let viewModels = spendingsByMonth.map {
                MonthlySpendingViewModel(
                    monthlySpending: MonthlySpending(monthOfYear: $0, spendings: $1)
                )
            }.sorted(by: {$0.monthlySpending.monthOfYear > $1.monthlySpending.monthOfYear})
            
            return MonthlySpendingsSection(
                viewModels: viewModels,
                homeCoordinator: homeCoordinator
            )
        } catch {
            // Error
            return MonthlySpendingsSection(viewModels: [], homeCoordinator: homeCoordinator)
        }
    }
}

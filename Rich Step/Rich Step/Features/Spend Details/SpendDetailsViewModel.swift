//
//  SpendingDetailsViewModel.swift
//  Rich Step
//
//  Created by Hanna on 01/10/23.
//

import UIKit

class SpendDetailsViewModel: SpendDetailProtocol {
    
    // MARK: - Public properties
    var sections: [DetailsCellSection] {
        [detailsSection()]
    }
    let homeCoordinator: HomeCoordinator
    let currentMonthOfYear: MonthOfYear
    var spendings: [Spending]
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var totalAmount: String? {
        let value = spendings.reduce(0, { $0 + $1.amount})
        return String(value)
    }
    
    var monthOfYear: String {
        "\(currentMonthOfYear.year)/\(currentMonthOfYear.month)"
    }
    
    // MARK: - Init
    init(homeCoordinator: HomeCoordinator, currentMonthOfYear: MonthOfYear) {
        spendings = []
        self.homeCoordinator = homeCoordinator
        self.currentMonthOfYear = currentMonthOfYear
    }
    
    private func detailsSection() -> DetailsCellSection {
        do {
            
            let fromDate = currentMonthOfYear.start()
            let toDate = currentMonthOfYear.end()
            let request = Spending.fetchRequest()
            request.predicate = NSPredicate(
                format: "date >= %@ && date <= %@", argumentArray: [fromDate, toDate]
            )
            
            spendings = try context.fetch(request)
            return DetailsCellSection(
                viewModels: spendings.map {
                    DetailsCellViewModel(spending: $0)
                },
                homeCoordinator: homeCoordinator)
        } catch {
            // error
            return DetailsCellSection(viewModels: [], homeCoordinator: homeCoordinator)
        }
    }
}

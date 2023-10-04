//
//  SpendingsRepository.swift
//  Rich Step
//
//  Created by Hanna on 03/10/23.
//

import Foundation

class SpendingsRepository {
    static let instance: SpendingsRepository = SpendingsRepository()
    
    private let formatter = DateFormatter()
    private var spendings: [Spending]
    
    private init() {
        formatter.dateFormat = "yyyy/MM/dd"
        spendings = [Spending]()
        spendings.append(contentsOf: [
            Spending(id: 1, date: parseMonth("2023/09/15")!, description: "Shopping", amount: 100),
            Spending(id: 2, date: parseMonth("2023/08/01")!, description: "Wifi", amount: 100),
            Spending(id: 3, date: parseMonth("2023/07/01")!, description: "Gas", amount: 100),
            Spending(id: 4, date: parseMonth("2023/07/01")!, description: "Water", amount: 100),
            Spending(id: 5, date: parseMonth("2023/06/01")!, description: "Supermarket", amount: 100),
            Spending(id: 6, date: parseMonth("2023/06/01")!, description: "Anime", amount: 100),
            Spending(id: 7, date: parseMonth("2023/05/01")!, description: "Gym", amount: 100),
            Spending(id: 8, date: parseMonth("2023/05/01")!, description: "House rent", amount: 100),
        ])
    }
    
    private func parseMonth(_ date: String) -> Date? {
        return formatter.date(from: date)
    }
    
    func getSpendings() -> [Spending] {
        return spendings
    }
    
    func findSpendingById(id: Int) -> Spending? {
        return spendings.first(where: {$0.id == id})
    }
    
    func addSpending(spending: Spending) {
        spendings.append(spending)
    }
    
    func updateSpending(id: Int, spending: Spending) {
        if let indexOfSpending = spendings.firstIndex(where: {$0.id == id}) {
            spendings[indexOfSpending] = spending
        }
    }
}

//
//  UpdateSpendViewModel.swift
//  Rich Step
//
//  Created by Hanna on 02/10/23.
//

import UIKit

class UpdateSpendViewModel: UpdateSpendViewModelProtocol {
    
    //  MARK: - Public properties
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let spending: Spending
    var onUpdated: (() -> Void)?
    
    var date: Date {
        spending.date ?? Date.now
    }
    
    var amount: Float {
        spending.amount
    }
    
    var desc: String {
        spending.desc ?? ""
    }
    
    // MARK: - Init
    init(spending: Spending) {
        self.spending = spending
    }
    
    func didTapUpdateButton(_ date: Date, _ itemDesc: String, _ amount: Float) {
        onTapItemUpdateButton(
            UpdateSpendDTO(date: date,
                           itemDescription: itemDesc,
                           amount: amount))
    }
    
    func onTapItemUpdateButton(_ dto: UpdateSpendDTO) {
        spending.date = dto.date
        spending.desc = dto.itemDescription
        spending.amount = dto.amount
        do {
            try context.save()
            onUpdated?()
        } catch {
            // Handle error
        }
    }
}

struct UpdateSpendDTO {
    var date: Date
    var itemDescription: String
    var amount: Float
}

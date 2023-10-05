//
//  AddSpendViewModel.swift
//  Rich Step
//
//  Created by Hanna on 04/10/23.
//

import UIKit

class AddSpendViewModel: AddSpendViewModelProtocol {
    
    //  MARK: - Public properties
    var onSaved: (() -> Void)?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func didTapAddButton(_ itemDesc: String, _ amount: Float, _ date: Date) {
        onTapItemAddButton(AddSpendDTO(date: date, itemDescription: itemDesc, amount: amount))
    }
    
    func onTapItemAddButton(_ dto: AddSpendDTO) {
        let spendig = Spending(context: context)
        spendig.desc = dto.itemDescription
        spendig.amount = dto.amount
        spendig.date = dto.date
        do {
            try context.save()
            onSaved?()
        } catch {
            // Handle error
        }
    }
}

struct AddSpendDTO {
    var date: Date
    var itemDescription: String
    var amount: Float
}

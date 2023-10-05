//
//  UpdateSpendViewModel.swift
//  Rich Step
//
//  Created by Hanna on 02/10/23.
//

import UIKit

class UpdateSpendViewModel: UpdateSpendViewModelProtocol {
    
    //  MARK: - Public properties
    var onUpdated: (() -> Void)?
    // fix date
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func didTapUpdate(_ itemDesc: String, _ amount: Float) {
        onTapItemUpdateButton(UpdateSpendDTO(date: Date.now, itemDescription: itemDesc, amount: amount))
    }
    
    func onTapItemUpdateButton(_ dto: UpdateSpendDTO) {
        let spendig = Spending(context: context)
        spendig.desc = dto.itemDescription
        spendig.amount = dto.amount
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

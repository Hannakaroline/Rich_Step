//
//  DetailsCellViewModel.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import Foundation

class DetailsCellViewModel: DetailsTableViewCellProtocol {
    
    // MARK: - Public properties
    var spending: Spending
    
    // MARK: - Init
    init(spending: Spending) {
        self.spending = spending
    }
    
    var description: String {
        return spending.desc ?? ""
    }
    
    var date: String {
        return Util.instance.format(date: spending.date)
    }
    
    var amount: String {
        return "\(spending.amount)"
    }
}

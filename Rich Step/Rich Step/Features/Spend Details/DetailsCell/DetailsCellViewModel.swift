//
//  DetailsCellViewModel.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import Foundation

protocol DetailsCellViewModelProtocol: DetailsTableViewCellProtocol { }
class DetailsCellViewModel: DetailsCellViewModelProtocol {
    
    // MARK: - Public properties
    var spending: Spending
    
    // MARK: - Init
    init(spending: Spending) {
        self.spending = spending
    }
    
    var description: String? {
        return spending.description
    }
    
    var date: String? {
        return "\(spending.date)"
    }
    
    var amount: String? {
        return "\(spending.amount)"
    }
}

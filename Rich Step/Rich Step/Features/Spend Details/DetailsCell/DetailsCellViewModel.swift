//
//  DetailsCellViewModel.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import Foundation

protocol DetailsCellViewModelProtocol: DetailsTableViewCellProtocol {
    
}
class DetailsCellViewModel: DetailsCellViewModelProtocol {
    
    var detailsViewModel: DetailsModel
    
    // MARK: - Init
    init(detailsViewModel: DetailsModel) {
        self.detailsViewModel = detailsViewModel
    }
    
    var nameLabel: String? {
        return detailsViewModel.name
    }
    
    var dateLabel: String? {
        return detailsViewModel.date
    }
    
    var valueLabel: String? {
        return detailsViewModel.value
    }
}

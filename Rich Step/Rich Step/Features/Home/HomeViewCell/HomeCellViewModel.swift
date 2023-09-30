//
//  HomeCellViewModel.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import Foundation

class HomeCellViewModel {

    var homeCellModel: HomeModel
    
    init(homeCellModel: HomeModel) {
        self.homeCellModel = homeCellModel
    }
}

extension HomeCellViewModel: HomeCellViewModelProtocol {
    
    var dateLabel: String? {
        return homeCellModel.date
    }
    
    var valueLabel: String? {
        return homeCellModel.value
    }
}

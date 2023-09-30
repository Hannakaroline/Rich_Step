//
//  HomeCellViewModel.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import Foundation

protocol HomeCellViewModelProtocol: HomeCellProtocol {
    var onTapDetailsButton: (() -> Void)? { get set }
}

class HomeCellViewModel: HomeCellViewModelProtocol {

    var homeCellModel: HomeModel
    
    init(homeCellModel: HomeModel) {
        self.homeCellModel = homeCellModel
    }
    var onTapDetailsButton: (() -> Void)?
    
    var dateLabel: String? {
        return homeCellModel.date
    }
    
    var valueLabel: String? {
        return homeCellModel.value
    }
    
    func didTapDetails() {
        onTapDetailsButton?()
    }
}

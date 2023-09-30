//
//  HomeViewModel.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import Foundation

class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: - Public properties
    var fetchSections: [HomeCellSection] {
        [homeSections()]
    }
    
    private func homeSections() -> HomeCellSection {
        HomeCellSection(
            viewModel: HomeModel.allCases.map {
            HomeCellViewModel(homeCellModel: $0)
        })
    }
}

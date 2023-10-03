//
//  SpendingDetailsViewModel.swift
//  Rich Step
//
//  Created by Hanna on 01/10/23.
//

import Foundation
protocol DetailsViewModelProtocol: SpendDetailProtocol { }

class SpendDetailsViewModel: DetailsViewModelProtocol {
    
    // MARK: - Public properties
    var fetchSections: [DetailsCellSection] {
        [detailsSection()]
    }
    let homeCoordinator: HomeCoordinator
    
    // MARK: - Init
    init(homeCoordinator: HomeCoordinator) {
        self.homeCoordinator = homeCoordinator
    }
    private func detailsSection() -> DetailsCellSection {
        DetailsCellSection(
            viewModels: DetailsModel.allCases.map {
                DetailsCellViewModel(detailsViewModel: $0)
            }, homeCoordinator: homeCoordinator)
    }
}

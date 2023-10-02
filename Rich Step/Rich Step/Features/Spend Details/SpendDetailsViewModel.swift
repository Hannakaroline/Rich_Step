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

    private func detailsSection() -> DetailsCellSection {
        DetailsCellSection(
            viewModel: DetailsModel.allCases.map {
                DetailsCellViewModel(detailsViewModel: $0)
            })
    }
}

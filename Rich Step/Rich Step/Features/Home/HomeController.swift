//
//  HomeController.swift
//  Rich Step
//
//  Created by Hanna on 29/09/23.
//

import UIKit

class HomeController<ViewModel: HomeViewModelProtocol>: UIViewController {
   
    // MARK: - Private properties
    private let contentView: HomeView
    private let viewModel: ViewModel
    
    // MARK: - Init
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        self.contentView = HomeView.loadNib()
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.bindIn(viewModel: viewModel)
    }
}

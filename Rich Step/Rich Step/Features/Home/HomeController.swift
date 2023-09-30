//
//  HomeController.swift
//  Rich Step
//
//  Created by Hanna on 29/09/23.
//

import UIKit

protocol HomeControllerDelegateProtocol: AnyObject {}

class HomeController<ViewModel: HomeViewModelProtocol>: UIViewController {
   
    // MARK: - Private properties
    private let contentView: HomeView
    private let viewModel: ViewModel
    private weak var delegate: HomeControllerDelegateProtocol?
    
    // MARK: - Init
    init(viewModel: ViewModel, delegate: HomeControllerDelegateProtocol?) {
        self.viewModel = viewModel
        self.delegate = delegate
        self.contentView = HomeView.loadNib()
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycle
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.bindIn(viewModel: viewModel)
    }
}

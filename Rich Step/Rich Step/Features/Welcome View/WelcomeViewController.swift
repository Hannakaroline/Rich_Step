//
//  SpendingListController.swift
//  Rich Step
//
//  Created by Hanna on 29/09/23.
//

import UIKit

protocol WelcomeViewControllerDelegate: AnyObject {
    func goToHome()
}

class WelcomeViewController<ViewModel: WelcomeViewProtocol>: UIViewController {
    
    // MARK: - Private properties
    private let contentView: WelcomeView
    private var viewModel: ViewModel
    private weak var delegate: WelcomeViewControllerDelegate?
    
    // MARK: - Init
    init(viewModel: ViewModel, delegate: WelcomeViewControllerDelegate?){
        self.viewModel = viewModel
        self.delegate = delegate
        self.contentView = WelcomeView.loadNib()
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
        bind()
    }
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
        
        viewModel.onTapStartButton = { [weak self] in
            self?.delegate?.goToHome()
        }
    }
}

//
//  HomeController.swift
//  Rich Step
//
//  Created by Hanna on 29/09/23.
//

import UIKit

protocol HomeControllerDelegate: AnyObject {
    func goToAddSpend()
}

class HomeController<ViewModel: HomeViewProtocol>: UIViewController {
   
    // MARK: - Private properties
    private let contentView: HomeView
    private var viewModel: ViewModel
    private weak var delegate: HomeControllerDelegate?
    
    // MARK: - Init
    init(viewModel: ViewModel, delegate: HomeControllerDelegate?) {
        self.viewModel = viewModel
        self.delegate = delegate
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
    
    @objc func didTapAdd() {
        viewModel.didTapAddButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.view.backgroundColor = UIColor.systemBlue
//        UINavigationBar.appearance().isTranslucent = false
        title = "Home"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        bind()
    }
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
        viewModel.onTapAddButton = { [weak self] in
            self?.delegate?.goToAddSpend()
        }
    }
}

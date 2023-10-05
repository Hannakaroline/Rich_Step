//
//  UpdateSpendController.swift
//  Rich Step
//
//  Created by Hanna on 02/10/23.
//

import UIKit

protocol UpdateSpendControllerDelegate: AnyObject {
    func goToSpendDetails()
}

class UpdateSpendController: UIViewController {
    
    // MARK: - Private properties
    private let contentView: UpdateSpend
    private let viewModel: UpdateSpendViewModel
    private weak var delegate: UpdateSpendControllerDelegate?
    
    // MARK: Init
    init(viewModel: UpdateSpendViewModel, delegate: UpdateSpendControllerDelegate?) {
        self.viewModel = viewModel
        self.delegate = delegate
        self.contentView = UpdateSpend.loadNib()
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
        title = "Spend Item Detail"
        bind()
    }
    
    // MARK: - Bind
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
        viewModel.onUpdated = { [weak self] in
            self?.delegate?.goToSpendDetails()
        }
    }
}

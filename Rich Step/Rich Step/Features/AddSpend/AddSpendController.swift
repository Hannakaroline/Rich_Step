//
//  AddSpend.swift
//  Rich Step
//
//  Created by Hanna on 04/10/23.
//

import UIKit
protocol AddSpendControllerDelegate: AnyObject {
    func goToHome()
}

class AddSpendController: UIViewController {
    
    // MARK: - Private properties
    private let contentView: AddSpend
    private var viewModel: AddSpendViewModel
    private weak var delegate: AddSpendControllerDelegate?

    // MARK: - Init
    init(viewModel: AddSpendViewModel, delegate: AddSpendControllerDelegate?) {
        self.viewModel = viewModel
        self.delegate = delegate
        self.contentView = AddSpend.loadNib()
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
        bind()
        title = "Add Spend"
    }
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
        viewModel.onSaved = { [weak self] in
            self?.delegate?.goToHome()
        }
    }
}

//
//  UpdateSpendController.swift
//  Rich Step
//
//  Created by Hanna on 02/10/23.
//

import UIKit

protocol UpdateSpendControllerDelegate: AnyObject { }

class UpdateSpendController<ViewModel: UpdateSpendViewModelProtocol>: UIViewController {
    
    // MARK: - Private properties
    private let contentView: UpdateSpend
    private let viewModel: ViewModel
    private weak var delegate: UpdateSpendControllerDelegate?
    
    // MARK: Init
    init(viewModel: ViewModel, delegate: UpdateSpendControllerDelegate?) {
        self.viewModel = viewModel
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
        contentView.bindIn(viewModel: viewModel)
        title = "Spend Item Detail"
    }
}

//
//  SpendDetailsController.swift
//  Rich Step
//
//  Created by Hanna on 01/10/23.
//

import UIKit
protocol SpendControllerDelegate: AnyObject { }

class SpendDetailsController<ViewModel: SpendDetailProtocol>: UIViewController {
    
    // MARK: - Private properties
    private let contentView: SpendDetail
    private let viewModel: ViewModel
    private weak var delegate: SpendControllerDelegate?
    
    // MARK: Init
   init(viewModel: ViewModel, delegate: SpendControllerDelegate?) {
        self.viewModel = viewModel
        self.delegate = delegate
       self.contentView = SpendDetail.loadNib()
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
        title = "Spend Detail \(viewModel.monthOfYear)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contentView.reloadData()
    }
}

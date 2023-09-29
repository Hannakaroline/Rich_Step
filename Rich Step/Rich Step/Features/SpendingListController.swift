//
//  SpendingListController.swift
//  Rich Step
//
//  Created by Hanna on 29/09/23.
//

import UIKit

protocol SpendingListControllerDelegateProtocol: AnyObject {}

class SpendingListController: UIViewController {
    
    // MARK: - Private properties
    private let contentView: SpendingView
    private weak var delegate: SpendingListControllerDelegateProtocol?
    
    // MARK: - Init
    init(delegate: SpendingListControllerDelegateProtocol?){
        self.delegate = delegate
        self.contentView = SpendingView.loadNib()
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
    }
}

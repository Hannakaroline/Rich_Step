//
//  SpendingListController.swift
//  Rich Step
//
//  Created by Hanna on 29/09/23.
//

import UIKit

protocol SpendingListControllerDelegateProtocol: AnyObject {}

class WelcomeViewController: UIViewController {
    
    // MARK: - Private properties
    private let contentView: WelcomeView
    private weak var delegate: SpendingListControllerDelegateProtocol?
    
    // MARK: - Init
    init(delegate: SpendingListControllerDelegateProtocol?){
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
    }
}

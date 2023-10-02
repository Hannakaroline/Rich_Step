//
//  AddSpendController.swift
//  Rich Step
//
//  Created by Hanna on 02/10/23.
//

import UIKit

class AddSpendController: UIViewController {
    
    // MARK: - Private properties
    private let contentView: AddSpend
    
    // MARK: Init
    init() {
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
    }
}

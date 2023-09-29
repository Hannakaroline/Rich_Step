//
//  SpendListFactory.swift
//  Rich Step
//
//  Created by Hanna on 29/09/23.
//

import UIKit

class SpendListFactory {
    static func spendList(delegate: SpendingListControllerDelegateProtocol?) -> UIViewController{
        // TODO ViewModel, UIViewController, useCase
        return SpendingListController(delegate: delegate)
    }
}

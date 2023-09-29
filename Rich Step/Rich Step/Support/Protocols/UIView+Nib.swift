//
//  UIView+Nib.swift
//  Rich Step
//
//  Created by Hanna on 29/09/23.
//

import UIKit

extension UIView {

    static func loadNib(name: String? = nil) -> Self {
        let nibName = name ?? String(describing: self)
        
        guard let view = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first as? Self else {
            fatalError("could not load \(nibName) as xib")
        }
        
        return view
    }
}

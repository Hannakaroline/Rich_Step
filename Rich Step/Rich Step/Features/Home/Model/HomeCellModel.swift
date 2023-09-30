//
//  HomeCellModel.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import Foundation

enum HomeCellModel: CaseIterable {
    case sectionOne
    case sectionTwo
    
    var date: String{
        switch self {
        case .sectionOne: return "2023/43"
        case .sectionTwo: return "129.00"
        }
    }
    
    var value: String {
        switch self {
        case .sectionOne: return "2123/43"
        case .sectionTwo: return "123.00"
        }
    }
}

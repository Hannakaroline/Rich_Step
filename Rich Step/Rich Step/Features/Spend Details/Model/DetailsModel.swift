//
//  DetailsModel.swift
//  Rich Step
//
//  Created by Hanna on 01/10/23.
//

import Foundation

enum DetailsModel: CaseIterable {
    case sectionOne
    case sectionTwo
    
    var name: String {
        switch self {
        case .sectionOne: return "Shopping"
        case .sectionTwo: return "Internet wifi"
        }
    }
    
    var date: String {
        switch self {
        case .sectionOne: return "2023/43"
        case .sectionTwo: return "2023/41"
        }
    }
    
    var value: String {
        switch self {
        case .sectionOne: return "1000.00"
        case .sectionTwo: return "123.00"
        }
    }
}

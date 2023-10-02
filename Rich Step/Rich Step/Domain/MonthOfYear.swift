//
//  MonthOfYear.swift
//  Rich Step
//
//  Created by Hanna on 02/10/23.
//

import Foundation

struct MonthOfYear: Hashable {
    var month: Int
    var year: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(month)
        hasher.combine(year)
    }
}



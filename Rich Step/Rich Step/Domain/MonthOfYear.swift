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

extension MonthOfYear: Comparable {
    static func <(lhs: MonthOfYear, rhs: MonthOfYear) -> Bool {
        lhs.year < rhs.year || lhs.month < rhs.month
    }
}

extension MonthOfYear {
    func start() -> Date {
        let components = DateComponents(
            timeZone: TimeZone.current,
            year: year,
            month: month,
            day: 1
        )
        return Calendar(identifier: .gregorian).date(from: components)!
    }
    
    func end() -> Date {
        return Calendar(identifier: .gregorian)
            .date(byAdding: DateComponents(month: 1, second: -1), to: start())!
    }
}

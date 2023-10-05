//
//  Util.swift
//  Rich Step
//
//  Created by Hanna on 05/10/23.
//

import Foundation

struct Util {
    private let dateFormatter: DateFormatter
    
    static let instance = Util()
    
    private init() {
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "ja_JP")
    }
    
    func format(date: Date?) -> String {
        guard date != nil else {
            return "Not set"
        }
        return dateFormatter.string(for: date) ?? ""
    }
    
    func parseDate(date: String) -> Date {
        return dateFormatter.date(from: date) ?? Date.now
    }
}

extension Date {
    func format() -> String {
        return Util.instance.format(date: self)
    }
}


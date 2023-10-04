//
//  Spending+CoreDataProperties.swift
//  Rich Step
//
//  Created by Hanna on 04/10/23.
//
//

import Foundation
import CoreData


extension Spending {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Spending> {
        return NSFetchRequest<Spending>(entityName: "Spending")
    }

    @NSManaged public var id: Int32
    @NSManaged public var date: Date?
    @NSManaged public var desc: String?
    @NSManaged public var amount: Float

}

extension Spending : Identifiable {

}

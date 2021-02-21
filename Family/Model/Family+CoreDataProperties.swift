//
//  Family+CoreDataProperties.swift
//  Family
//
//  Created by Richard Long on 21/02/2021.
//
//

import Foundation
import CoreData


extension Family {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Family> {
        return NSFetchRequest<Family>(entityName: "Family")
    }

    @NSManaged public var familyName: String?
    @NSManaged public var member: FamilyMembers?

}

extension Family : Identifiable {

}

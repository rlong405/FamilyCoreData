//
//  FamilyMembers+CoreDataProperties.swift
//  Family
//
//  Created by Richard Long on 22/02/2021.
//
//

import Foundation
import CoreData


extension FamilyMembers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FamilyMembers> {
        return NSFetchRequest<FamilyMembers>(entityName: "FamilyMembers")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var family: Family?

}

extension FamilyMembers : Identifiable {

}

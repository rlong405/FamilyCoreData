//
//  Family+CoreDataProperties.swift
//  Family
//
//  Created by Richard Long on 22/02/2021.
//
//

import Foundation
import CoreData


extension Family {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Family> {
        return NSFetchRequest<Family>(entityName: "Family")
    }

    @NSManaged public var familyName: String?
    @NSManaged public var member: NSSet?

}

// MARK: Generated accessors for member
extension Family {

    @objc(addMemberObject:)
    @NSManaged public func addToMember(_ value: FamilyMembers)

    @objc(removeMemberObject:)
    @NSManaged public func removeFromMember(_ value: FamilyMembers)

    @objc(addMember:)
    @NSManaged public func addToMember(_ values: NSSet)

    @objc(removeMember:)
    @NSManaged public func removeFromMember(_ values: NSSet)

}

extension Family : Identifiable {

}

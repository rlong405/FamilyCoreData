//
//  FamilyDataManager.swift
//  Family
//
//  Created by Richard Long on 21/02/2021.
//

import Foundation
import SwiftUI
import CoreData

class FamilyDataManager {

   private class func getContext() -> NSManagedObjectContext {

      return PersistenceController.shared.container.viewContext

   }

   class func fetchAllFamilies() -> [Family] {

      let context = getContext()
      var families = [Family]()
      let familyRequest: NSFetchRequest<Family> = Family.fetchRequest()
      do {
         families = try context.fetch(familyRequest) }
      catch {
         print (error)
      }
      return families
   }

   class func fetchFamilyMembers(family:Family) -> [FamilyMembers] {

      let context = getContext()
      var members = [FamilyMembers]()
      let membersRequest: NSFetchRequest<FamilyMembers> = FamilyMembers.fetchRequest()

      let predicateInFamily = NSPredicate(format: "family = %@", family)
      membersRequest.predicate = predicateInFamily

      do {
         members = try context.fetch(membersRequest) }
      catch {
         print (error)
      }
      return members
   }



class func newFamily(familyName:String)  {

   let context = getContext()
   let newFamily = Family(context: context)

   newFamily.familyName = familyName

   do {
     try context.save()
   }
   catch {
      print (error)
   }
}

   class func newFamilyMember(firstName:String, lastName: String, family:Family)  {

      let context = getContext()
      let newFamilyMember = FamilyMembers(context: context)

      newFamilyMember.firstName = firstName
      newFamilyMember.lastName = lastName
      family.addToMember(newFamilyMember)

      do {
        try context.save()
      }
      catch {
         print (error)
      }
   }

}



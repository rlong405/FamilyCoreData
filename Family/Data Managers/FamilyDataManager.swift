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

    //  let appDelegate = UIApplication.shared.delegate as! AppDelegate
      return PersistenceController.shared.container.viewContext
     // return appDelegate.persistentContainer.viewContext

   }

   class func fetchAllFamilies() -> [Family] {

         let context = getContext()
         var families = [Family]()
         let familyRequest: NSFetchRequest<Family> = Family.fetchRequest()

         // two OR predicates - not registered in current race OR registered in no races.
    //     let predicateInRace = NSPredicate(format: "racingIn = %@", race)
    //     let predicateNotRegisteredInAnyRace = NSPredicate(format: "ANY enteredAs.racingIn = NULL")
     //    let predicateOr = NSCompoundPredicate(orPredicateWithSubpredicates: [predicateNotAlreadyRegisteredInCurrentRace, predicateNotRegisteredInAnyRace])

       //  pyRequest.predicate = predicateInRace
     //    boatRequest.predicate = NSPredicate(format: "ANY enteredAs.racingIn != %@", race)
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

}




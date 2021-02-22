//
//  ViewModel.swift
//  Family
//
//  Created by Richard Long on 21/02/2021.
//

import Foundation

class FamilyViewModel: ObservableObject {

   @Published var arrayOfFamilies: [Family] = []
   @Published var arrayOfFamilyMembers: [FamilyMembers] = []

   init(){
      fetchFamilies()
   }

   func addNewFamily(familyName: String) {
      FamilyDataManager.newFamily(familyName: familyName)
   }

   func addNewFamilyMember(firstName: String, lastName: String, family:Family) {
      FamilyDataManager.newFamilyMember(firstName: firstName, lastName: lastName, family:family)
   }

   func fetchFamilies(){

      arrayOfFamilies = FamilyDataManager.fetchAllFamilies()

   }

   func fetchFamilyMembers(family:Family) {
      arrayOfFamilyMembers = FamilyDataManager.fetchFamilyMembers(family:family)
   }


}

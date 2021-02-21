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
   func fetchFamilies(){

      arrayOfFamilies = FamilyDataManager.fetchAllFamilies()

   }

   func fetchFamilyMembers(family:Family) {
      arrayOfFamilyMembers = FamilyDataManager.fetchFamilyMembers(family:family)


   }


}

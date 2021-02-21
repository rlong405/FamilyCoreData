//
//  FamilyMembersView.swift
//  Family
//
//  Created by Richard Long on 21/02/2021.
//

import SwiftUI

struct FamilyMembersView: View {
   @ObservedObject var viewModel: FamilyViewModel = FamilyViewModel()
   var family:Family

   var body: some View {



        List {
         ForEach(viewModel.arrayOfFamilyMembers) { familymember in
            Text("\(familymember.firstName ?? "Cannot find first Name") \(familymember.lastName ?? "Cannot find first Name")")
            }
        }
   .onAppear{
      viewModel.fetchFamilyMembers(family: family)
   }
   .navigationBarTitle("Family Members", displayMode: .automatic)
}
}

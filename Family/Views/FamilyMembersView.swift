//
//  FamilyMembersView.swift
//  Family
//
//  Created by Richard Long on 21/02/2021.
//

import SwiftUI

struct FamilyMembersView: View {
   @ObservedObject var viewModel: FamilyViewModel = FamilyViewModel()
   @State var showNewFamilyMemberPopUp = false
   @State var firstName = ""
   @State var lastName = ""
   var family:Family

   var body: some View {
      ZStack {
         List {
            ForEach(viewModel.arrayOfFamilyMembers) { familymember in
               Text("\(familymember.firstName ?? "Cannot find first Name") \(familymember.lastName ?? "Cannot find first Name")")
               }
           }
      .onAppear{
         viewModel.fetchFamilyMembers(family: family)
      }
         if showNewFamilyMemberPopUp {
            VStack {
            TextField("First Name", text: $firstName)
               .textFieldStyle(RoundedBorderTextFieldStyle())
               .padding()

               TextField("Last Name", text: $lastName)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
                  .padding()

               Button(action:{
                  viewModel.addNewFamilyMember(firstName: firstName, lastName: lastName, family: family)
                  viewModel.fetchFamilyMembers(family: family)
                  firstName = ""
                  lastName = ""
                  showNewFamilyMemberPopUp.toggle()
               }) {
                  Text("Add")
                     .padding()
               }
            }.frame(maxWidth: .infinity, minHeight: 150)

            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(color: Color.black.opacity(0.5), radius: 2, x: 2, y: 2)
                           .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 3)))
            .padding()
         }
      }
      .navigationBarTitle("Family Members", displayMode: .automatic)
      .navigationBarItems(trailing:
                           Button(action: {
                              showNewFamilyMemberPopUp.toggle()
                           })
                           {
                              Text("Add New Family Member")
                           })
   }
}


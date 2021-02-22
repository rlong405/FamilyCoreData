//
//  ContentView.swift
//  Family
//
//  Created by Richard Long on 21/02/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
   @ObservedObject var viewModel: FamilyViewModel = FamilyViewModel()
   @State var showNewFamilyPopUp = false
   @State var familyName: String = ""





//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>

    var body: some View {
      NavigationView{

         ZStack {
            List {
            ForEach(viewModel.arrayOfFamilies) { family in
               NavigationLink(destination: FamilyMembersView(family: family)) {
               Text("\(family.familyName ?? "Cannot find family")")
               }
            }

           }.onAppear{
            #if targetEnvironment(simulator)
            printCoreDataPath()
            #endif
           }

            if showNewFamilyPopUp {
               VStack {
               TextField("Family Name", text: $familyName)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
                  .padding()
                  Button(action:{
                     viewModel.addNewFamily(familyName: familyName)
                     viewModel.fetchFamilies()
                     familyName = ""
                     showNewFamilyPopUp.toggle()
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
         .navigationBarTitle("Families", displayMode: .automatic)
         .navigationBarItems(trailing:
                              Button(action: {
                                 showNewFamilyPopUp.toggle()
                              })
                              {
                                 Text("Add New Family")
                              })
      }

        }
}


func printCoreDataPath(){
   let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.applicationSupportDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)

   let dbName = PersistenceController.shared.container.name
   let pasteboard = UIPasteboard.general
   pasteboard.string = (path[0] + "/\(dbName).sqlite")
  print (path[0] + "/\(dbName).sqlite")

}

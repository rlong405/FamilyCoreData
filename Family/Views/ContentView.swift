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

   let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>

    var body: some View {
      NavigationView{

        List {
         ForEach(viewModel.arrayOfFamilies) { family in
            NavigationLink(destination: FamilyMembersView(family: family)) {
            Text("\(family.familyName ?? "Cannot find family")")
            }
         }

        }.onAppear{
         print (paths[0])
        }
        .navigationBarTitle("Families", displayMode: .automatic)
      }
        }
    }

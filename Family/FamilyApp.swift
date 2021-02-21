//
//  FamilyApp.swift
//  Family
//
//  Created by Richard Long on 21/02/2021.
//

import SwiftUI

@main
struct FamilyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

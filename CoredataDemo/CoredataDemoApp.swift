//
//  CoredataDemoApp.swift
//  CoredataDemo
//
//  Created by Sumit on 14/07/24.
//

import SwiftUI

@main
struct CoredataDemoApp: App {
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
    
 }

//
//  TurtleFocusApp.swift
//  TurtleFocus
//
//  Created by Chris Turner on 19/02/2023.
//

import SwiftUI

@main
struct TurtleFocusApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

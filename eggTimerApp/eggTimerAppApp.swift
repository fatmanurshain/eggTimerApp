//
//  eggTimerAppApp.swift
//  eggTimerApp
//
//  Created by Fatmanur Şahin on 18.09.2024.
//

import SwiftUI

@main
struct eggTimerAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//
//  UIForCoreDataDemoApp.swift
//  UIForCoreDataDemo
//
//  Created by Echeandia Pais, Manuel Arturo on 2024-03-28.
//

import SwiftUI

@main
struct UIForCoreDataDemoApp: App {
  
  let persistenceController = PersistenceController.shared
  
    var body: some Scene {
        WindowGroup {
          ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Denys Nazymok on 11.04.2023.
//

import SwiftUI

@main
struct BookWormApp: App {
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}

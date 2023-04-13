//
//  DataController.swift
//  BookWorm
//
//  Created by Denys Nazymok on 11.04.2023.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { descriptor, error in
            if let error = error {
                print("Fail with load persistent store")
            }
        }
    }
}

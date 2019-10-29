//
//  CoreDataStack.swift
//  TasksSwiftUICoreData
//
//  Created by Nelson Gonzalez on 10/29/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation
import CoreData


class CoreDataStack {
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    static let shared = CoreDataStack()
    
    lazy var container: NSPersistentContainer =  {
        let container = NSPersistentContainer(name: "TasksSwiftUICoreData")
        container.loadPersistentStores { (_, error) in
            
            if let error = error {
                fatalError("Failed to load persistent stores: \(error)")
            }
            
        }
        
        return container
    }()
   
}

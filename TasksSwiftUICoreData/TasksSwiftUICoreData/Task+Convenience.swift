//
//  Task+Convenience.swift
//  TasksSwiftUICoreData
//
//  Created by Nelson Gonzalez on 10/29/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    convenience init(name: String, notes: String? = nil, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        self.name = name
        self.notes = notes
    }
}

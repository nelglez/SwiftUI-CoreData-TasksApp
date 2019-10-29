//
//  TaskController.swift
//  TasksSwiftUICoreData
//
//  Created by Nelson Gonzalez on 10/29/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation
import CoreData

class TaskController: ObservableObject {
    
    @Published var entries: [Task] = []
    
    init() {
        getTasks()
    }
    
    func saveToPersistentStore() {
        let moc = CoreDataStack.shared.mainContext
        do {
            try moc.save()
            getTasks()
        } catch {
            NSLog("Error saving managed object context: \(error)")
        }
    }
    
    func getTasks() {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let moc = CoreDataStack.shared.mainContext
        
        do {
            entries = try moc.fetch(fetchRequest)
            
        } catch {
            NSLog("Error fetching tasks: \(error)")
            
        }
    }
    
    func createEntry(title: String, bodyText: String) {
        let _ = Task(name: title, notes: bodyText)
        saveToPersistentStore()
        
        
    }
    
    //        func updateEntry(entry: Task, title: String, bodyText: String) {
    //            entry.name = title
    //            entry.notes = bodyText
    //            saveToPersistentStore()
    //        }
    //
    
    func updateTask(taskIndex: Int, title: String, bodyText: String) {
        let modifiedTask = self.entries[taskIndex]
        modifiedTask.name = title
        modifiedTask.notes = bodyText
        saveToPersistentStore()
    }
    
    
    func deleteTask(todoIndex: Int) {
        let deletedTask = self.entries[todoIndex]
        let moc = CoreDataStack.shared.mainContext
        moc.delete(deletedTask)
        saveToPersistentStore()
    }
    
}

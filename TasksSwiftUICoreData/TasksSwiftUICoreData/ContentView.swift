//
//  ContentView.swift
//  TasksSwiftUICoreData
//
//  Created by Nelson Gonzalez on 10/29/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskController = TaskController()
    @State private var todoTitle: String = ""
    @State private var todoNotes: String = ""
    var body: some View {
        List{
            Section(header: Text("New Todo")) {
                HStack {
                    VStack {
                        TextField("Task Title", text: $todoTitle)
                        TextField("Notes", text: $todoNotes)
                    }.padding()
                    Button(action: {
                        guard !self.todoTitle.isEmpty, !self.todoNotes.isEmpty else {
                            print("Both fields are required")
                            return
                        }
                        self.taskController.createEntry(title: self.todoTitle, bodyText: self.todoNotes)
                        self.todoTitle = ""
                        self.todoNotes = ""
                    }) {
                        Image(systemName: "plus").font(.largeTitle)
                    }
                }
            }
            Section(header: Text("Active Tasks")) {
                ForEach(taskController.entries, id: \.self){ task in
                    RowItem(task: task)
                }.onDelete { indexSet in
                    self.taskController.deleteTask(todoIndex: indexSet.first!)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

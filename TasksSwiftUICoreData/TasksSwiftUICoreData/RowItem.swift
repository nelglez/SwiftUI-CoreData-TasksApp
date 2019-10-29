//
//  RowItem.swift
//  TasksSwiftUICoreData
//
//  Created by Nelson Gonzalez on 10/29/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//https://engineering.q42.nl/swiftui-optionals/

import SwiftUI

struct RowItem: View {
    var task: Task
    
    var body: some View {
        VStack(alignment: .leading) {
            //handling optionals
            task.name.map { Text($0).font(.largeTitle) }
            task.notes.map { Text($0).font(.subheadline) }
          //  Text(task.name!).font(.largeTitle)
          //  Text(task.notes!).font(.footnote)
        }
    }
}

struct RowItem_Previews: PreviewProvider {
    static var previews: some View {
        RowItem(task: Task(name: "Test", notes: "Testing"))
    }
}

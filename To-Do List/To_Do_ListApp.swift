//
//  To_Do_ListApp.swift
//  To-Do List
//
//  Created by Himanshu Sherkar on 01/10/23.
//

import SwiftUI
import SwiftData

@main
struct To_Do_ListApp: App {
    let container: ModelContainer = {
        let schema = Schema([ToDoTask.self])
        let container = try! ModelContainer(for: schema, configurations: [])
        
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
            ToDoListView()
        }
        .modelContainer(container)
    }
}

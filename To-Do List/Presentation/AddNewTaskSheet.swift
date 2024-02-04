//
//  AddNewTaskSheet.swift
//  To-Do List
//
//  Created by Himanshu Sherkar on 01/10/23.
//

import SwiftUI
import SwiftData

// MARK: - AddNewTaskSheet View
struct AddNewTaskSheet: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var isCompleted: Bool = false
    @State private var name: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                HStack {
                    CheckBoxView(checked: $isCompleted)
                    TextField("Task Name", text: $name)
                }
            }
            .navigationTitle("New Task")
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        let task = ToDoTask(isCompleted: isCompleted, name: name)
                        context.insert(task)
                        
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddNewTaskSheet()
}

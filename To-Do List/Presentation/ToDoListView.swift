//
//  ToDoListView.swift
//  To-Do List
//
//  Created by Himanshu Sherkar on 01/10/23.
//

import SwiftUI
import SwiftData

// MARK: - ToDoList View
struct ToDoListView: View {
    @Environment(\.modelContext) var context
    @Query(sort: \ToDoTask.name) var tasks: [ToDoTask]
    @State var isShowingAddTaskSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    ToDoListCell(task: task)
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(tasks[index])
                    }
                }
            }
            .navigationTitle("To-Do List")
            .sheet(isPresented: $isShowingAddTaskSheet) {
                AddNewTaskSheet()
            }
            .toolbar {
                if !tasks.isEmpty {
                    Button("Add Task", systemImage: "plus") {
                        isShowingAddTaskSheet = true
                    }
                }
            }
            .overlay {
                if tasks.isEmpty {
                    ContentUnavailableView(label: {
                        Label("No Tasks", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("Start adding tasks to your list.")
                    }, actions: {
                        Button("Add Task") {
                            isShowingAddTaskSheet = true
                        }
                    })
                    .offset(y: -40)
                }
            }
        }
    }
}

// MARK: - ToDoList Cell View
struct ToDoListCell: View {
    let task: ToDoTask
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.square.fill" : "square")
                .foregroundColor(task.isCompleted ? Color(UIColor.systemBlue) : Color.secondary)
                .onTapGesture {
                    self.task.isCompleted.toggle()
                }
        }
    }
}

// MARK: - CheckBox View
struct CheckBoxView: View {
    @Binding var checked: Bool

    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}

#Preview {
    ToDoListView()
}

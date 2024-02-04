//
//  Task.swift
//  To-Do List
//
//  Created by Himanshu Sherkar on 01/10/23.
//

import Foundation
import SwiftData

@Model
class ToDoTask {
    var isCompleted: Bool
    var name: String
    
    init(isCompleted: Bool, name: String) {
        self.isCompleted = isCompleted
        self.name = name
    }
}

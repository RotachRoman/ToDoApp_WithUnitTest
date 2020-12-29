//
//  Task.swift
//  ToDoAppWithTest
//
//  Created by Rotach Roman on 12.12.2020.
//

import Foundation

struct Task{
    let title: String
    let description: String?
    let date: Date
    let location: Location?
    
    init(title: String,
         description: String? = nil,
         date: Date? = nil,
         location: Location? = nil){
        self.title = title
        self.description = description
        self.date = date ?? Date()
        self.location = location
    }
}

extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        if lhs.title == rhs.title,
           lhs.description == rhs.description,
           lhs.location == rhs.location {
            return true
        }
        return false
    }
}

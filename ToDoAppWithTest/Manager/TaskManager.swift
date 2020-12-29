//
//  TaskManager.swift
//  ToDoAppWithTest
//
//  Created by Rotach Roman on 15.12.2020.
//

import Foundation

class TaskManager {
    
    var tasksCount: Int {
        return tasks.count
    }
    var doneTasksCount: Int {
        return doneTasks.count
    }
    
    private var tasks: [Task] = []
    private var doneTasks: [Task] = []
    
    func add(task: Task){
        if !tasks.contains(task){
            tasks.append(task)
        }
    }
    
    func checkTask(at index: Int){
        let task = tasks.remove(at: index)
        doneTasks.append(task)
    }
    
    func uncheckTask(at index: Int){
        let task = doneTasks.remove(at: index)
        tasks.append(task)
    }
    
    func task(at index: Int) -> Task {
        return tasks[index]
    }
    
    func doneTask(at index: Int) -> Task {
        return doneTasks[index]
    }
    
    func removeAll(){
        tasks.removeAll()
        doneTasks.removeAll()
    }
}


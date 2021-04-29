//
//  TaskController.swift
//  Task-CoreData
//
//  Created by Tim Green on 4/27/21.
//

import CoreData

class TaskController {
    
    // MARK: - Properties
    static let sharedInstance = TaskController()
    
    // SOURCE OF TRUTH (one location to save the information I want to display)
    var tasks: [Task] = []
    
    private lazy var fetchRequest: NSFetchRequest<Task> = {
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    // MARK: - CRUD functions
    func createTaskWith(name: String, notes: String, dueDate: Date?) {
        // TIMGREEN To Do: Ask Kelsey about why we don't have to append to our Source of Truth.
        
        //   let task =
        Task(name: name, notes: notes, dueDate: dueDate)
        // tasks.append(task)
        CoreDataStack.saveContext()
    }
    
    func fetchTasks() {
        let tasks = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        
        self.tasks = tasks
    }
    
    func update(task: Task, name: String, notes: String?, dueDate: Date?) {
        
        CoreDataStack.saveContext()
    }
    
    func toggleIsComplete(task: Task) {
        
        task.isComplete.toggle()
        CoreDataStack.saveContext()
    }
}  // End of class

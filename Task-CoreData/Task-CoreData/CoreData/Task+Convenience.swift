//
//  Task+Convenience.swift
//  Task-CoreData
//
//  Created by Tim Green on 4/27/21.
//

import CoreData

extension Task {
    
    @discardableResult convenience init(name: String, notes: String?, dueDate: Date?, context: NSManagedObjectContext = CoreDataStack.context, isComplete: Bool = false) {
        
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = isComplete
    }
    
}

    

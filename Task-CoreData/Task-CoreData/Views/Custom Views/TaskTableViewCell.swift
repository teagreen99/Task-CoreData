//
//  TaskTableViewCell.swift
//  Task-CoreData
//
//  Created by Tim Green on 4/28/21.
//

import UIKit

protocol TaskCompletionDelegate: AnyObject {
    
    func taskCellButtonTapped(_ cell: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    // MARK: - Properties
    var task: Task? {
        
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: TaskCompletionDelegate?
    
    
    
    
    
    
    
    // MARK: - IBActions
    @IBAction func completeButtonTapped(_ sender: Any) {
        if let delegate = delegate {
            delegate.taskCellButtonTapped(self)
        }
    }
    
    // MARK: - Functions
    
    func updateViews() {
        
        guard let task = task else {return}
        
        taskNameLabel.text = task.name
        if task.isComplete {
            completionButton.setBackgroundImage(#imageLiteral(resourceName: "complete"), for: .normal)
        } else {
            completionButton.setBackgroundImage(#imageLiteral(resourceName: "incomplete"), for: .normal)
        }
    }
} // End of class



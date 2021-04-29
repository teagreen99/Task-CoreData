//
//  TaskDetailViewController.swift
//  Task-CoreData
//
//  Created by Tim Green on 4/27/21.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    
    
    // MARK: - Properties
    var task: Task?
    var date: Date?
    
    
    // MARK: - IBActions
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let taskName = taskNameTextField.text, !taskName.isEmpty else {return}
        
        if let task = task {
            
            TaskController.sharedInstance.update(task: task, name: taskName, notes: taskNotesTextView.text, dueDate: date)
        } else {
            TaskController.sharedInstance.createTaskWith(name: taskName, notes: taskNotesTextView.text, dueDate: date)
        }
        navigationController?.popViewController(animated: true)
    }
    @IBAction func dueDatePickerDateChanged(_ sender: Any) {
        self.date = taskDueDatePicker.date
    }
    
    // MARK: - Functions
    func updateViews() {
        
        guard let task = task else {return}
        
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        taskDueDatePicker.date = task.dueDate ?? Date()
    }
}

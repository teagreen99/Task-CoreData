//
//  TaskListTableViewController.swift
//  Task-CoreData
//
//  Created by Tim Green on 4/27/21.
//

import UIKit

class TaskListTableViewController: UITableViewController {

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        TaskController.sharedInstance.fetchTasks()
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TaskController.sharedInstance.tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let myCustomCell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskTableViewCell else {return UITableViewCell()}
        
        
        let task = TaskController.sharedInstance.tasks[indexPath.row]
        //myCustomCell.textLabel?.text = task.name
        myCustomCell.task = task
        myCustomCell.delegate = self
        return myCustomCell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */


    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTaskDetailVC" {
            guard let destinationVC = segue.destination as? TaskDetailViewController,
                  let indexPath = tableView.indexPathForSelectedRow else {return}
            let task = TaskController.sharedInstance.tasks[indexPath.row]
            destinationVC.task = task
        }
    }
}


    // MARK: - Estension
extension TaskListTableViewController: TaskCompletionDelegate {
    func taskCellButtonTapped(_ cell: TaskTableViewCell) {
        guard let task = cell.task else {return}
        TaskController.sharedInstance.toggleIsComplete(task: task)
        cell.updateViews()
    }
    
    
        


} // End of extension


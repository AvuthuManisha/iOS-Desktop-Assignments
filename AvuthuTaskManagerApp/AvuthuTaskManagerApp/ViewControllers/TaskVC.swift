//
//  TaskVC.swift
//  AvuthuTaskManagerApp
//
//  Created by Avuthu,Manisha on 4/22/23.
//

import UIKit

class TaskVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tasksTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
                 
        let addBTN = UIBarButtonItem(title:"➕",style:.plain, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addBTN

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
             super.viewWillAppear(animated)
             
             tasksTableView.reloadData()
         }
    
    @objc func addButtonTapped() {
        self.performSegue(withIdentifier: "createTask", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createTask" {
            let createTask = segue.destination as! CreateTaskVC
            createTask.delegate = self
            
        }
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        
        case 0: return "Pending"
        
        case 1: return "Completed"
        
        case 2: return "Canceled"
        
        default: return nil
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        
        case 0: return PendingTasks.tasks.items.count
        
        case 1: return CompletedTasks.tasks.items.count
        
        case 2: return CanceledTasks.tasks.items.count
        
        default: return 0
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.section {
        
        case 0: cell.textLabel?.text = PendingTasks.tasks.items[indexPath.row]
        
        case 1: cell.textLabel?.text = CompletedTasks.tasks.items[indexPath.row]
        
        case 2: cell.textLabel?.text = CanceledTasks.tasks.items[indexPath.row]
        
        default: break
            
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        switch indexPath.section {
        
        case 0:
            let completedTask = UIContextualAction(style: .normal, title: "Complete") { (action, view, completion) in
                let task = PendingTasks.tasks.items.remove(at: indexPath.row)
                CompletedTasks.tasks.items.append(task)
                self.tasksTableView.reloadData()
                completion(true)
                
            }
            
            completedTask.backgroundColor = .systemGreen
            let canceledTask = UIContextualAction(style: .normal, title: "Cancel") { (action, view, completion) in
                let task = PendingTasks.tasks.items.remove(at: indexPath.row)
                CanceledTasks.tasks.items.append(task)
                self.tasksTableView.reloadData()
                completion(true)
                }
            
            canceledTask.backgroundColor = .red
            
            return UISwipeActionsConfiguration(actions: [canceledTask,completedTask])
        
        default: return nil
            
        }
        
    }
    
}

extension TaskVC: CreateTaskVCDelegate {
    
    func didCreateTask(_ task: String) {
        
        print("New task created: \(task)")
        PendingTasks.tasks.items.append(task)
        tasksTableView.reloadData()
        
    }

      






    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

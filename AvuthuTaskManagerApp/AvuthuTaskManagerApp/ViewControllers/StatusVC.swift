//
//  StatusVC.swift
//  AvuthuTaskManagerApp
//
//  Created by Avuthu,Manisha on 4/22/23.
//

import UIKit

class StatusVC: UIViewController {
    
    @IBOutlet weak var canceledTasksLBL: UILabel!
    
    
    @IBOutlet weak var completedTasksLBL: UILabel!
    
    
    @IBOutlet weak var pendingTasksLBL: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)

        
        pendingTasksLBL.text = "\(PendingTasks.tasks.items.count)"
        
        completedTasksLBL.text = "\(CompletedTasks.tasks.items.count)"
        
        canceledTasksLBL.text = "\(CanceledTasks.tasks.items.count)"
        
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

//
//  CreateTaskVC.swift
//  AvuthuTaskManagerApp
//
//  Created by Avuthu,Manisha on 4/22/23.
//

import UIKit
import Lottie

protocol CreateTaskVCDelegate: AnyObject {
    func didCreateTask(_ task: String)
}

class CreateTaskVC: UIViewController {
    
    
    weak var delegate: CreateTaskVCDelegate?
    var tasksTableView:UITableView?

    
    @IBOutlet weak var createTaskBTN: UIButton!
    
    
    @IBOutlet weak var animationView: LottieAnimationView!
    
    
    @IBOutlet weak var taskTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskTF.addTarget(self, action: #selector(readTask(_:)), for: .editingChanged)
        createTaskBTN.isEnabled=false

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func createTask(_ sender: Any) {
      
        if let taskText = taskTF.text {
            delegate?.didCreateTask(taskText)
           
        }
        taskTF.text=""
        animationView.animation = LottieAnimation.named("586-added")
        animationView.play { [weak self] (finished) in
            self?.dismiss(animated: true, completion: nil)
        }
    }
    
 
       
       
    @IBAction func readTask(_ sender: UITextField) {
        
        if let text = sender.text {
            
            createTaskBTN.isEnabled = !text.isEmpty
            
        }
        
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

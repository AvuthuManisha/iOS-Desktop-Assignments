//
//  ViewController.swift
//  HelloWorld
//
//  Created by Avuthu,Manisha on 2/4/23.
//

import UIKit

class HelloWorldVC: UIViewController {

    @IBOutlet weak var fullNameTF: UITextField!
    
    @IBOutlet weak var greetingLBL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.greetingLBL.text = ""
    }
    @IBAction func greet(_ sender: UIButton) {
        //early exiting
        guard let fullName = self.fullNameTF.text else {
            return
        }
        
        self.greetingLBL.text = "Howdy! \(fullName)"
    }
    
    
    @IBAction func clear(_ sender: UIButton) {
        self.fullNameTF.text = ""
        self.greetingLBL.text = ""
    }
    


}


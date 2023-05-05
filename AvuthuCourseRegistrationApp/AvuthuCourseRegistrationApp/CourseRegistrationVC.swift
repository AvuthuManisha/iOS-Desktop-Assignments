//
//  ViewController.swift
//  AvuthuCourseRegistrationApp
//
//  Created by Avuthu,Manisha on 2/4/23.
//

import UIKit

class CourseRegistrationVC: UIViewController {
    

    @IBOutlet weak var MessageLBL: UILabel!
    
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.MessageLBL.text = ""
    }
    
    
    @IBOutlet var courseSWCH: [UISwitch]!
    
    @IBAction func onSubmit(_ sender: UIButton) {
        var registerCourse = courseSWCH.filter{
            $0.isOn == true
        }
        var firstName = firstNameTF.text!
        var lastName = lastNameTF.text!
        if (firstName.isEmpty || lastName.isEmpty){
            MessageLBL.text = "Please enter your full name."
        }
        else if(registerCourse.count>0){
            MessageLBL.text = "CONFIRMATION\n \(firstName), \(lastName) has successfully enrolled in \(registerCourse.count) course(s), namely, (\(courseSWCH[2].isOn == true ? "iOS" : " ")\(courseSWCH[0].isOn == true ? " , Patterns" : " ")\(courseSWCH[1].isOn == true ? " ,Big Data" : " "))."
        }
        else{
            MessageLBL.text = """
Hi \(firstName),\(lastName) please select the courses of your choice.
"""
        }
        
        
    }
    
    @IBAction func toggleCourse(_ sender: UISwitch) {
      
    }
    
    
    
    @IBAction func onReset(_ sender: UIButton) {
        self.firstNameTF.text = ""
        self.lastNameTF.text = ""
        self.MessageLBL.text = ""
        for s in courseSWCH{
            s.isOn = false
        }
    
    }
    
}


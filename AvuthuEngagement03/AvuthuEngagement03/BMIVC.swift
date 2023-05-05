//
//  BMIVC.swift
//  AvuthuEngagement03
//
//  Created by Avuthu,Manisha on 4/8/23.
//

import UIKit

class BMIVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    

    @IBOutlet weak var ageTF: UITextField!
    
    @IBOutlet weak var weightTF: UITextField!
    
    @IBOutlet weak var heightPicker: UIPickerView!
    
    @IBOutlet weak var messageLBL: UILabel!
    

//    let feetData = Array(3...7)
//    let inchData = Array(0...12)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightPicker.delegate = self
        heightPicker.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 100
            
        }
        else {
            return 100
            
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            if row == 0 {
                return "Feet"
                
            }
            else {
                return "\(row)"
                
            }
            
        }
        else {
            if row == 0 {
                return "Inch"
                
            }
            else {
                return "\(row-1)"
                
            }
            
        }
        
    }
    
//    func calculateBMI(weight: Double, height: Double, age: Double) -> Double{
//        let heightInMeters = height/3.281
//        let bmi = weight / (heightInMeters * heightInMeters)
//        return bmi
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if component == 0 {
//            return "\(feetData[row]) ft"
//        } else {
//            return "\(inchData[row]) in"
//        }
//    }
//
//    @objc func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        if component == 0{
//            return feetData.count
//        } else {
//            return inchData.count
//        }
//    }
//
//    @objc(numberOfComponentsInPickerView:) func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 2
//    }
//
    @IBAction func onCalculate(_ sender: UIButton) {
        let Weight = Double(weightTF.text!) ?? 0
        let Feet = heightPicker.selectedRow(inComponent: 0)
        let Inches = heightPicker.selectedRow(inComponent: 1)-1
        let Height = Double(Feet * 12 + Inches)
        let BodyMassIndex = Weight / (Height * Height) * 703
        messageLBL.text = String(format: "Your Body Mass Index is: %.1f", BodyMassIndex)
        
//        guard let weight = Double(weightTF.text ?? ""), let age = Double(ageTF.text ?? "") else {
//            return
//        }
//        let feet = Double(feetData[heightPicker.selectedRow(inComponent: 0)])
//        let inches = Double(inchData[heightPicker.selectedRow(inComponent: 1)])
//        let height = (feet * 12 + inches) * 0.0254
//        let bmi = calculateBMI(weight: weight, height: height, age: age)
}
    
    @IBAction func onReset(_ sender: UIButton) {
        weightTF.text = ""
        ageTF.text = ""
        messageLBL.text = ""
        heightPicker.selectRow(0, inComponent: 0, animated: true)
        heightPicker.selectRow(0, inComponent: 1, animated: true)
        

//        weightTF.text = " "
//        ageTF.text = " "
//        heightPicker.selectRow(0, inComponent: 0, animated: true)
//        heightPicker.selectRow(0, inComponent: 1, animated: true)
//
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

//
//  ViewController.swift
//  AvuthuCalculatorApp
//
//  Created by Avuthu,Manisha on 2/9/23.
//

import UIKit
import MathExpression

class CalculatorVC: UIViewController {

    @IBOutlet weak var mathExpressionLBL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       mathExpressionLBL.text = " "
    }
    

    
    @IBAction func result(_ sender: UIButton) {
        guard let expression = self.mathExpressionLBL.text else {return}
                let value = self.evaluate(exp: "\(expression + "+0")")
                self.mathExpressionLBL.text = self.isInteger(value: value) ? "\(Int(value))" : "\(value)"
                return
       
    }
    
    
    @IBAction func tappedChar(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel, let buttonText = buttonTitle.text else{
            return
            
        }
        guard let expression = mathExpressionLBL.text else {return}
        if buttonText == "-" || buttonText == "+" {
            let value = self.evaluate(exp: expression)
            self.mathExpressionLBL.text = self.isInteger(value: value) ? "\(Int(value))" : "\(value)"
            self.mathExpressionLBL.text! += buttonText == "-" ? "-" : "+"
            
        }
        else{
            if buttonText == "×" || buttonText == "÷" {
                let value = self.evaluate(exp: self.mathExpressionLBL.text!)
                self.mathExpressionLBL.text = self.isInteger(value: value) ? "\(Int(value))" : "\(value)"
                self.mathExpressionLBL.text! += buttonText == "÷" ? "/" : "*"
                
            }
            else if self.mathExpressionLBL.text == "0"{
                self.mathExpressionLBL.text! = buttonText
                
            }else
            {
                self.mathExpressionLBL.text! += buttonText
                
            }
            
        }
        
    }
          
          
          
         
        
    @IBAction func inverse(_ sender: UIButton) {
        let expression = self.mathExpressionLBL.text!
        if let result = try? self.evaluate(exp: expression) {
            mathExpressionLBL.text = String(1 / result)
            
        }
        
    }


    
    @IBAction func calcTan(_ sender: UIButton) {
        let expression = self.mathExpressionLBL.text!
        if let result = try? self.evaluate(exp: expression) {
            mathExpressionLBL.text = String(tan(result))
            
        }
        
    }
    
    @IBAction func calcCos(_ sender: UIButton) {
        let expression = self.mathExpressionLBL.text!
        if let result = try? self.evaluate(exp: expression) {
            mathExpressionLBL.text = String(cos(result))
            
        }
    }
    
    @IBAction func calcSin(_ sender: UIButton) {
        let expression = self.mathExpressionLBL.text!
        if let result = try? self.evaluate(exp: expression) {
            mathExpressionLBL.text = String(sin(result))
            
        }
    }
    
    @IBAction func tenPow(_ sender: UIButton) {
        let expression = self.mathExpressionLBL.text!
        if let result = try? self.evaluate(exp: expression) {
            mathExpressionLBL.text = String(pow(10, result))
            
        }
    }

    @IBAction func factorial(_ sender: UIButton) {
        func factorial(_ n: Int) -> Int {
                if n <= 1 {
                    return 1
                }
                return n * factorial(n - 1)
            }
        let expression = self.mathExpressionLBL.text!
        if let result = try? self.evaluate(exp: expression) {
            mathExpressionLBL.text = String(factorial(Int(result)))
            
        }
        
    }
    
    @IBAction func naturalLog(_ sender: UIButton) {
        let expression = self.mathExpressionLBL.text!
        if let result = try? self.evaluate(exp: expression) {
            mathExpressionLBL.text = String(log(result))
            
        }
    }
    
    @IBAction func percent(_ sender: UIButton) {
        let expression = self.mathExpressionLBL.text!
        if let result = try? self.evaluate(exp: self.mathExpressionLBL.text!) {
            mathExpressionLBL.text = String(result / 100)
            
        }
    }
    
    @IBAction func flipSign(_ sender: UIButton) {
        guard let expression = Double(mathExpressionLBL.text!) else{
            return
        }
        let result = -expression
        mathExpressionLBL.text = String(result)
        
    }
    
    @IBAction func backspace(_ sender: UIButton) {
        if let currentText = mathExpressionLBL.text{
                    mathExpressionLBL.text = String(currentText.dropLast())
                }

    }
    
    @IBAction func clearExpression(_ sender: UIButton) {
        mathExpressionLBL.text = " "
    }
}



//
//  ViewController.swift
//  projectDemo
//
//  Created by Avuthu,Manisha on 4/30/23.
//

import UIKit
//import FirebaseFirestore

class ViewController: UIViewController {
    
    @IBOutlet weak var bedTypeTF: UITextField!
    
    @IBOutlet weak var roomTypeTF: UITextField!
    
    @IBOutlet weak var roomSizeTF: UITextField!
    
    @IBOutlet weak var amenitiesTF: UITextField!
    
    @IBOutlet weak var priceTF: UITextField!
    
    @IBOutlet weak var submitTF: UIButton!
    
//    let db = Firestore.firestore()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    
    @IBAction func submtBTN(_ sender: UIButton) {
//
//        let propertiesRef = db.collection("properties")
//
//        var newPropertyRef: DocumentReference? = nil
//                newPropertyRef = propertiesRef.addDocument(data: [
//                    "bedType": bedTypeTF.text ?? "",
//                    "roomType": roomTypeTF.text ?? "",
//                    "roomSize": roomSizeTF.text ?? "",
//                    "amenities": amenitiesTF.text ?? "",
//                    "price": priceTF.text ?? "",
//                    "timestamp": FieldValue.serverTimestamp()
//                ]) { err in
//                    if let err = err {
//                        print("Error adding document: \(err)")
//                    } else {
//                        print("Document added with ID: \(newPropertyRef!.documentID)")
//                    }
//                }
        
    }

}


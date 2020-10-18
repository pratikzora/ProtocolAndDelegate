//
//  SecondViewController.swift
//  ProtocolAndDelegate
//
//  Created by Pratik Zora on 2020-10-16.
//

import UIKit

protocol DataPass {
    func data(object:[String:String])
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtProvince: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtPostalCode: UITextField!
    @IBOutlet weak var txtPhoneNo: UITextField!
    
    var delegate:DataPass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        
        
        // Alert if user don't enter text name
        if txtName.text == "" {
            alert(title: "Please enter your name", message: "", delegate: self)
        } else if txtAddress.text == "" {
            alert(title: "Please enter your address", message: "", delegate: self)
        } else if txtCity.text == "" {
            alert(title: "Please enter your city", message: "", delegate: self)
        } else if txtProvince.text == "" {
            alert(title: "Please enter your province", message: "", delegate: self)
        }else if txtCountry.text == "" {
            alert(title: "Please enter your country", message: "", delegate: self)
        } else if txtPostalCode.text == "" {
            alert(title: "Please enter your postal code", message: "", delegate: self)
        } else if txtPhoneNo.text == "" {
            alert(title: "Please enter your phone number", message: "", delegate: self)
        } else {
            let dictionary:[String:String] = ["name":txtName.text!,"address":txtAddress.text!,"city":txtCity.text!,"province":txtProvince.text!,"country":txtCountry.text!,"postalcode":txtPostalCode.text!,"phone":txtPhoneNo.text!]
            delegate.data(object: dictionary)
            
            complitionAlert(title: "Form completed!", message: "", delegate: self)
            
        }
    }
    
    // Create alert function
    func alert(title:String, message:String, delegate:AnyObject) {
        
        // create new alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // add button to alert
        alert.addAction(UIAlertAction.init(title: "OK", style:.default, handler: { (action) in
            print("User tapped OK")
        }))
        
        // present the alert
        present(alert, animated: true, completion: nil)
    }
    
    // Create form complition alert
    func complitionAlert(title:String, message:String,delegate:AnyObject){
        
        let complitionAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Add Cancel action to alert
        complitionAlert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: { (action1) in
            print("User tapped cancel")
            
        }))
        
        // Add Go to Home action to alert after user complete the form
        complitionAlert.addAction(UIAlertAction.init(title: "Home", style: .default, handler: { (action) in
            self.goToHome()
        }))
        
        // Present the alert
        present(complitionAlert, animated: true) {
            print("Complition Alert Done")
        }
    }
    
    // Pop-up main view controller
    
    func goToHome() {
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "homeView") as! ViewController
        self.navigationController?.popViewController(animated: true)
        
    }
}

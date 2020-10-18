//
//  ViewController.swift
//  ProtocolAndDelegate
//
//  Created by Pratik Zora on 2020-10-16.
//

import UIKit

class ViewController: UIViewController, DataPass {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblProvince: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblPostalCode: UILabel!
    @IBOutlet weak var lblPhoneNo: UILabel!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToFormBtn(_ sender: Any) {
        
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "second") as! SecondViewController
        secondVC.delegate = self
        
        self.navigationController?.pushViewController(secondVC, animated: true)
        
    }
        
    func data(object: [String : String]) {
        
        lblName.text = object["name"]
        lblAddress.text = object["address"]
        lblCity.text = object["city"]
        lblProvince.text = object["province"]
        lblCountry.text = object["country"]
        lblPostalCode.text = object["postalcode"]
        lblPhoneNo.text = object["phone"]
    }
    
}


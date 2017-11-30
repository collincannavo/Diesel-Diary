//
//  MileageTrackerViewController.swift
//  MileageTracker
//
//  Created by Collin Cannavo on 11/21/17.
//  Copyright © 2017 Collin Cannavo. All rights reserved.
//

import UIKit
import Foundation

class MileageTrackerViewController: UIViewController {

    let url = "http://localhost..."
    
    @IBOutlet weak var vehicleTextField: UITextField!
    @IBOutlet weak var mileageTextField: UITextField!
   
    @IBAction func submitButtonTapped(_ sender: Any) {
        
        let requestURL = NSURL(fileURLWithPath: url)
        
        let request = NSMutableURLRequest(url: requestURL as URL!)
        
        request.httpMethod = "POST"
        
        let teamName = vehicleTextField.text
        let memberCount = mileageTextField.text
        
        let postParamaters = "name="+teamName!+"&member="+memberCount!
        
        request.httpBody = postParamaters.data(using: String.Encoding.utf8)
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
        
            
            if error != nil {
                print("error is \(error)")
                return;
            }
            
            do {
                let myJSON = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary
                
                if let parseJSON = myJSON {
                    var msg: String!
                    msg = parseJSON["message"] as! String
                    
                    print(msg)
                }
            } catch {
                print(error)
            }
        }
        dataTask.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

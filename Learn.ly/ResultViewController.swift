//
//  ResultViewController.swift
//  Learn.ly
//
//  Created by Haasith Sanka on 4/1/18.
//  Copyright © 2018 Haasith Sanka. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import Alamofire

class ResultViewController: UIViewController {

    @IBAction func goProfile(_ sender: Any) {
        performSegue(withIdentifier: "toProfile", sender: nil)
    }
    @IBOutlet var goProfile: UIButton!
    var percent:Double = 0.0
    var check:Bool = false
    var ref:DatabaseReference?
    var operation:String = ""
    var parentObjective: Double = 0.0
    var childId: String = ""
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "You got \(percent)%"
        check = checkObjective()
        viewButton.layer.cornerRadius = 5
        viewButton.layer.borderWidth = 1
    }
    
    func checkObjective() -> Bool
    {
        var bool:Bool = false
       
        ref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        print("user id is \(String(describing: userID))")
        ref?.child("parents").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            self.ref?.child("parents").child(userID!).removeAllObservers()
            let value = snapshot.value as? NSDictionary
            let objective = value?["objective"] as? String ?? ""
            self.childId = value?["childId"] as? String ?? ""
            self.parentObjective = objective.toDouble()!
            self.updateScores()
            if self.percent >= self.parentObjective{
                bool = true
                print("send SMS")
                self.sendSMS()
            }
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        return bool
    }
    
    @IBOutlet var viewButton: UIButton!
    func updateScores() {
        let userID = Auth.auth().currentUser?.uid
        ref = Database.database().reference().child("parents").child(userID!)
        //let key = ref.child(childId).key
        
        let childUpdates = ["/\(childId)/\(getOperation(operand: operation))/": "\(percent)/\(self.parentObjective)"]
        ref?.updateChildValues(childUpdates)
    }
    
    func sendSMS() {
        var topic:String = "Your child has reached the objective for "
        topic += getOperation(operand: operation)
        let phoneNum:String = "2134198195"
        
        let params: Parameters = [
            "phonenum": phoneNum,
            "topic": topic
        ]
        Alamofire.request("https://radiant-indexer-190004.appspot.com/post", method: .post, parameters: params).responseString {
            response in
            print("Success: \(response.result.isSuccess)")
            
        }
    }

    
    func getOperation(operand: String) ->String
    {
        if operand == "+"
        {
            return "addition"
        }
        else if operand == "-"
        {
            return "subtraction"
        }
        else if operand == "X"
        {
            return "multiplication"
        }
        
        return "division"
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

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}


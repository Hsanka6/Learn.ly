//
//  SetupViewController.swift
//  Learn.ly
//
//  Created by Haasith Sanka on 3/31/18.
//  Copyright © 2018 Haasith Sanka. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SetupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var ref:DatabaseReference?
    var userRef:DatabaseReference?
    
    @IBAction func sendData(_ sender: Any) {
        print("go to database")
        var topics:String = ""
        if topicsSelected.count > 0
        {
            topics = topicsSelected[0]
            var i = 1
            while(i < topicsSelected.count){
                topics += ", " + topicsSelected[i]
                i += 1
            }
        }
        ref = Database.database().reference()
        child = Child(gd: grade, obj: objective, add: "0/\(objective)", sub: "0/\(objective)", mult: "0/\(objective)", div: "0/\(objective)", topic: topics)
        print("email " + email + " reward: \(reward)" + " objective " + objective)
        let parentDict = [ "objective": objective, "reward": reward as Any, "PhoneNum": phoneNumber] as [String: Any]
        ref?.child("parents").child(uid).setValue(parentDict)
        
        let childDict = ["grade": child?.grade, "addition":child?.addition,"multiplication":child?.multiplication,"subtraction":child?.subtraction,"division":child?.division, "topic":child?.topics ]
        userRef = Database.database().reference().child("parents").child(uid)
        let userChild = userRef?.childByAutoId()//.setValue(childDict)
        userChild?.setValue(childDict)
        let childId = userChild?.key
        print("childId \(String(describing: childId))")
        
        let newDict = [ "objective": objective, "reward": reward as Any, "PhoneNum": phoneNumber,"childId": childId] as [String: Any]
        userRef?.setValue(newDict)
        userChild?.setValue(childDict)
        
        
        performSegue(withIdentifier: "toMain", sender: nil)
        
    }
    @IBAction func confirmButton(_ sender: Any) {
        print("go to database")
        var topics:String = ""
        if topicsSelected.count > 0
        {
            topics = topicsSelected[0]
            var i = 1
            while(i < topicsSelected.count){
                topics += ", " + topicsSelected[i]
                i += 1
            }
        }
        ref = Database.database().reference()
        child = Child(gd: grade, obj: objective, add: "0/\(objective)", sub: "0/\(objective)", mult: "0/\(objective)", div: "0/\(objective)", topic: topics)
        print("email " + email + " reward: \(reward)" + " objective " + objective)
        let parentDict = [ "objective": objective, "reward": reward as Any, "PhoneNum": phoneNumber] as [String: Any]
        ref?.child("parents").child(uid).setValue(parentDict)
        
        let childDict = ["grade": child?.grade, "addition":child?.addition,"multiplication":child?.multiplication,"subtraction":child?.subtraction,"division":child?.division, "topic":child?.topics ]
        userRef = Database.database().reference().child("parents").child(uid)
        let userChild = userRef?.childByAutoId()//.setValue(childDict)
        userChild?.setValue(childDict)
        let childId = userChild?.key
        print("childId \(String(describing: childId))")
        
        let newDict = [ "objective": objective, "reward": reward as Any, "PhoneNum": phoneNumber,"childId": childId] as [String: Any]
        userRef?.setValue(newDict)
        userChild?.setValue(childDict)
        
        
        performSegue(withIdentifier: "toMain", sender: nil)
    }
    @IBOutlet var tableView: UITableView!
    var setUpArray = ["Email", "Grade", "Topics", "Objective", "Reward for Objective Completed", "Phone Number"]
    var grade:String = ""
    var email:String = ""
    var objective:String = ""
    var reward:Int = 0
    var phoneNumber:String = ""
    var topicsSelected = [String]()
    var child: Child?
    var uid:String = ""
    
    let user = Auth.auth().currentUser
    
    let navigationBar = UINavigationBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        print("Reward \(reward)")
        print("Phone \(phoneNumber)")
        if let user = user {
            // The user's ID, unique to the Firebase project.
            // Do NOT use this value to authenticate with your backend server,
            // if you have one. Use getTokenWithCompletion:completion: instead.
            // ...
            email = user.email!
            uid = user.uid
        }
        
        //setupNav()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setUpArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "setupCell")
        {
            cell.textLabel?.textColor = UIColor.white
            cell.detailTextLabel?.textColor = UIColor.white
            print(setUpArray[indexPath.row])
            cell.textLabel?.text = setUpArray[indexPath.row]
            if indexPath.row == 0
            {
                cell.detailTextLabel?.text = email
            }
            else if indexPath.row == 1
            {
                cell.detailTextLabel?.text = grade
            }
            else if indexPath.row == 2
            {
                if topicsSelected.count > 0
                {
                    var topics:String = topicsSelected[0]
                    var i = 1
                    while(i < topicsSelected.count){
                        topics += ", " + topicsSelected[i]
                        i += 1
                    }
                    cell.detailTextLabel?.text = topics
                }
            }
            else if indexPath.row == 3
            {
                cell.detailTextLabel?.text = objective
            }
            else if indexPath.row == 4
            {
                cell.detailTextLabel?.text = "\(reward)"
            }
            else if indexPath.row == 5
            {
                cell.detailTextLabel?.text = phoneNumber
            }

            //cell.userData.text
            return cell
        }
        return UITableViewCell()
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if setUpArray[indexPath.row] == "Grade"
        {
            performSegue(withIdentifier: "toGrade", sender: nil)
        }
        else if setUpArray[indexPath.row] == "Topics"
        {
            performSegue(withIdentifier: "toTopics", sender: nil)
        }
        else if setUpArray[indexPath.row] == "Objective"
        {
            performSegue(withIdentifier: "toObjective", sender: nil)
        }
        else if setUpArray[indexPath.row] == "Reward for Objective Completed"
        {
            performSegue(withIdentifier: "toReward", sender: nil)
        }
    }
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGrade" {
            if let destination = segue.destination as? ViewController {
                destination.grade = grade
                destination.topicsSelected = topicsSelected
                destination.objective = objective
                destination.reward = reward
                destination.phoneNumber = phoneNumber
            }
        }
        else if segue.identifier == "toTopics" {
            if let destination = segue.destination as? TopicViewController {
                destination.grade = grade
                destination.topicsSelected = topicsSelected
                destination.objective = objective
                destination.reward = reward
                destination.phoneNumber = phoneNumber
            }
        }
        else if segue.identifier == "toObjective" {
            if let destination = segue.destination as? ObjectiveViewController {
                destination.grade = grade
                destination.topicsSelected = topicsSelected
                destination.objective = objective
                destination.reward = reward
                destination.phoneNumber = phoneNumber
            }
        }
       
        
    }
 
   
 

}





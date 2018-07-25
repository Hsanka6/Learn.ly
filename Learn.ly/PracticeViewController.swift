//
//  PracticeViewController.swift
//  Learn.ly
//
//  Created by Haasith Sanka on 3/31/18.
//  Copyright © 2018 Haasith Sanka. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PracticeViewController: UIViewController/*, UITableViewDelegate, UITableViewDataSource*/ {

    var topics = [String]()
    var allTopics:String = ""
    var childId:String = ""
    var operation:String = ""
    var ref:DatabaseReference?
    //@IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PRACTICE")
        
        
//        let tabBar = self.tabBarController as! TabBarController
//        print(tabBar.objective)
//        print(tabBar.topicsSelected[0])
//        print("this is \(Double(str)!)")
        //getTopics()

    }

//    func getTopics()
//    {
//        print("getTopics")
//
//        ref = Database.database().reference()
//        let userID = Auth.auth().currentUser?.uid
//        print("user id is \(String(describing: userID))")
//        ref?.child("parents").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
//            print("get ChildId")
//            let value = snapshot.value as? NSDictionary
//            self.childId = value?["childId"] as? String ?? ""
//
//            self.ref?.child("parents").child(userID!).child(self.childId).observeSingleEvent(of: .value, with: { (snapshot) in
//                // Get user value
//                let value = snapshot.value as? NSDictionary
//                self.allTopics = value?["topic"] as? String ?? ""
//                print(self.allTopics)
//
//                if (self.allTopics.range(of: ", ") != nil)
//                {
//                    self.topics = self.allTopics.components(separatedBy: ", ")
//                }
//                else
//                {
//                    self.topics.append(self.allTopics)
//                }
//                self.tableView.reloadData()
//                // ...
//            }) { (error) in
//                print(error.localizedDescription)
//            }
//
//            // ...
//        }) { (error) in
//            print(error.localizedDescription)
//        }
//
//
//
//    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return topics.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "practiceCell")
//        cell?.textLabel?.textColor = UIColor.white
//        cell?.textLabel?.text = topics[indexPath.row]
//        return cell!
//    }
//
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if topics[indexPath.row] == "Addition"
//        {
//            operation = "+"
//        }
//        else if topics[indexPath.row] == "Multiplication"
//        {
//            operation = "X"
//        }
//        else if topics[indexPath.row] == "Division"
//        {
//            operation = "\u{00f7}"
//        }
//        else if topics[indexPath.row] == "Subtraction"
//        {
//            operation = "-"
//        }
//        performSegue(withIdentifier: "toMath", sender: nil)
//    }
//
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toMath" {
//            if let destination = segue.destination as? MathViewController {
//                destination.operation = operation
//
//            }
//        }
//    }
    

}

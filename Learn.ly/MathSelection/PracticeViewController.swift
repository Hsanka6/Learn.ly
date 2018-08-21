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

class PracticeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet var tableView: UITableView!
    var topics = [String]()
    var children = [Child]()
    var allTopics:String = ""
    var childId:String = ""
    var operation:String = ""
    var email:String = ""
    var uid:String = ""
    let user = Auth.auth().currentUser

    //@IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PRACTICE")
        tableView.delegate = self
        tableView.dataSource = self
        
        if let user = user {
            email = user.email!
            uid = user.uid
        }
        getKids()
        

    }
    
    
   
        
    func getKids(){
        DataService.ds.REF_PARENT.child(uid).observe(.value, with: { snapshot in
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot]{
                for snap in snapshot{
                    print("snap is \(snap)")
                    if let postDict = snap.value as? Dictionary<String, AnyObject>{
                        let key = snap.key
                        let child = Child(postKey: key, postDict: postDict)
                        self.children.append(child)
                    }
                }
            }
            self.tableView.reloadData()
            
        })
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return children.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topicCell")
        let child = children[indexPath.row]
        print("child name is \(child.name)")
        
        cell?.textLabel?.text = child.name
        cell?.detailTextLabel?.text = child.grade
        cell?.textLabel?.textColor = UIColor.white
        cell?.detailTextLabel?.textColor = UIColor.white
        return cell!
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        performSegue(withIdentifier: "toMathSections", sender: nil)
    }

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

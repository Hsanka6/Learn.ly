////
////  ViewController.swift
////  Learn.ly
////
////  Created by Haasith Sanka on 3/30/18.
////  Copyright © 2018 Haasith Sanka. All rights reserved.
////
//
//import UIKit
//
//class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
//    
//    @IBOutlet var tableView: UITableView!
//    
//    var gradeArray = ["Kindergarten", "1st Grade", "2nd Grade", "3rd Grade", "4th Grade", "5th Grade"]
//    var grade:String = ""
//    var objective:String = ""
//    var topicsSelected = [String]()
//    var reward:Int = 0
//    var phoneNumber:String = ""
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print("SET GRADE")
//        tableView.delegate = self
//        tableView.dataSource = self
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return gradeArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "grade")
//        cell?.textLabel?.textColor = UIColor.white
//        cell?.textLabel?.text = gradeArray[indexPath.row]
//        return cell!
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        grade = gradeArray[indexPath.row]
//        performSegue(withIdentifier: "confirmGrade", sender: nil)
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "confirmGrade" {
//            if let destination = segue.destination as? SetupViewController {
//                destination.grade = grade
//                destination.topicsSelected = topicsSelected
//                destination.objective = objective
//                destination.reward = reward
//                destination.phoneNumber = phoneNumber
//                
//            }
//        }
//    }
//    
//    
//
//}
//

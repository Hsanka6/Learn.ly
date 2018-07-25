//
//  TopicViewController.swift
//  Learn.ly
//
//  Created by Haasith Sanka on 3/31/18.
//  Copyright © 2018 Haasith Sanka. All rights reserved.
//

import UIKit

class TopicViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    var topicArray = ["Multiplication", "Subtraction", "Division", "Addition"]
    var topicsSelected = [String]()
    var objective:String = ""
    var grade: String = ""
    var reward:Int = 0
    var phoneNumber:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SET TOPICS")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topic")
        cell?.textLabel?.textColor = UIColor.white
        cell?.textLabel?.text = topicArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select")
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark
        {
            print("unmarked \(topicArray[indexPath.row])")
            topicsSelected = topicsSelected.filter { $0 != "\(topicArray[indexPath.row])" }
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        }
        else
        {
            print("marked")
            topicsSelected.append(topicArray[indexPath.row])
            print(topicsSelected[0])
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        
    }
    
    @IBAction func confirmTopics(_ sender: Any) {
        performSegue(withIdentifier: "confirmObjective", sender: nil)
    }
    
    @IBOutlet var confirmTopics: UIBarButtonItem!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "confirmTopics" {
            if let destination = segue.destination as? SetupViewController {
                destination.topicsSelected = topicsSelected
                destination.grade = grade
                destination.objective = objective
                destination.reward = reward
                destination.phoneNumber = phoneNumber
            }
         }
    }

}

//
//  ObjectiveViewController.swift
//  Learn.ly
//
//  Created by Haasith Sanka on 3/31/18.
//  Copyright © 2018 Haasith Sanka. All rights reserved.
//

import UIKit

class ObjectiveViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var objectiveArray = ["70","80","90", "100"]
    var objective:String = ""
    var topicsSelected = [String]()
    var grade: String = ""
    var reward:Int = 0
    var phoneNumber:String = ""
    
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SET OBJECTIVE")
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectiveArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "objective")
        cell?.textLabel?.textColor = UIColor.white
        cell?.textLabel?.text = objectiveArray[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        objective = objectiveArray[indexPath.row]
        performSegue(withIdentifier: "confirmObjective", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "confirmObjective" {
            if let destination = segue.destination as? SetupViewController {
                destination.objective = objective
                destination.grade = grade
                destination.topicsSelected = topicsSelected
                destination.reward = reward
                destination.phoneNumber = phoneNumber
            }
        }
    }
    

}

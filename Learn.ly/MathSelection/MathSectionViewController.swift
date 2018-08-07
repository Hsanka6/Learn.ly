//
//  MathSectionViewController.swift
//  Learn.ly
//
//  Created by Haasith Sanka on 8/3/18.
//  Copyright © 2018 Haasith Sanka. All rights reserved.
//

import UIKit

class MathSectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    var operation:String = ""
    
    var topics = ["Addition", "Subtraction","Multiplication","Division"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topic")
        cell?.textLabel?.text = topics[indexPath.row]
        return cell!
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if topics[indexPath.row] == "Addition"
            {
                operation = "+"
            }
            else if topics[indexPath.row] == "Multiplication"
            {
                operation = "X"
            }
            else if topics[indexPath.row] == "Division"
            {
                operation = "\u{00f7}"
            }
            else if topics[indexPath.row] == "Subtraction"
            {
                operation = "-"
            }
        performSegue(withIdentifier: "toMath", sender: nil)
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

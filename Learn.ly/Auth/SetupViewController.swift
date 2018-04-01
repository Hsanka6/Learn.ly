//
//  SetupViewController.swift
//  Learn.ly
//
//  Created by Haasith Sanka on 3/31/18.
//  Copyright © 2018 Haasith Sanka. All rights reserved.
//

import UIKit
import Firebase

class SetupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var setUpArray = ["Email", "Grade", "Topics", "Objective"]
    var grade:String = ""
    var email:String = ""
    var objective:String = ""
    var topicsSelected = [String]()
    
    let user = Auth.auth().currentUser
    
    let navigationBar = UINavigationBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        if let user = user {
            // The user's ID, unique to the Firebase project.
            // Do NOT use this value to authenticate with your backend server,
            // if you have one. Use getTokenWithCompletion:completion: instead.
            // ...
            email = user.email!
        }
        
        //setupNav()
        
    }
    
//    func setupNav(){
//        navigationBar.isTranslucent = false
//        navigationBar.delegate = self
//        navigationBar.backgroundColor = .white
//        //navigationBar.items = [standaloneItem]
//
//        navigationBar.translatesAutoresizingMaskIntoConstraints = false
//        navigationBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        navigationBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//
//        if #available(iOS 11, *) {
//            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        } else {
//            navigationBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        }
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setUpArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "setupCell")
        {
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
                var topics:String = ""
                for t in topicsSelected {
                    topics += t
                }
                cell.detailTextLabel?.text = topics
            }
            else if indexPath.row == 3
            {
                cell.detailTextLabel?.text = objective
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
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let height: CGFloat = 50 //whatever height you want to add to the existing height
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80)
    }
 

}





//
//  ProfileViewController.swift
//  Learn.ly
//
//  Created by Haasith Sanka on 3/31/18.
//  Copyright © 2018 Haasith Sanka. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import PassKit

class ProfileViewController: UIViewController,PKPaymentAuthorizationViewControllerDelegate, UITableViewDelegate, UITableViewDataSource {

    var paymentReq: PKPaymentRequest!
    let user = Auth.auth().currentUser
    var email:String = ""
    var uid:String = ""
    var children = [Child]()
    

    var profileArray = ["Objective", "Reward", "Multiplication","Additon", "Subtraction", "Division", "Reward Kid"]
    var subtitleArray = [String]()
    @IBOutlet var tableView: UITableView!
    
    func payKid() {
        let paymentNetworks = [PKPaymentNetwork.amex, .visa, .masterCard, .discover]
        if PKPaymentAuthorizationViewController.canMakePayments(usingNetworks: paymentNetworks) {
            
            paymentReq = PKPaymentRequest()
            paymentReq.currencyCode = "USD"
            paymentReq.countryCode = "US"
            paymentReq.merchantIdentifier = "merchant.com.learnly"
            
            paymentReq.supportedNetworks = paymentNetworks
            paymentReq.merchantCapabilities = .capability3DS
            
            
            // if rewardAmount = "5" {
            let voucher = getPaymentItem(cost: subtitleArray[1])
            paymentReq.paymentSummaryItems = voucher
            
            if let applePayVC = PKPaymentAuthorizationViewController.init(paymentRequest: paymentReq) {
                applePayVC.delegate = self;
                self.present(applePayVC, animated: true, completion: nil)
            } else {
                print("Invalid applePayVC")
            }
            //            } else {
            //                print("Invalid rewardAmount")
            //            }
            
        } else {
            print("Set up Apple Pay")
        }
    }
    
    @IBAction func payKid(_ sender: Any) {
       
        
    }
    
    
    
    
    
    var ref:DatabaseReference?
    
    var parentRef:DatabaseReference?
    var topics = [String]()
    var childId:String = ""
    
    
    func getKids(){
//        ref = Database.database().reference()
//        print("getTopics")
//        let userID = Auth.auth().currentUser?.uid
//        print("user id is \(String(describing: userID))")
//        
//        var idKeys = [String]()
//        parentRef = Database.database().reference().child(uid)
//        parentRef?.observe(.value) { snapshot in
//            for i in snapshot.children{
//                self.parentRef?.child(String(describing: i)).observe(.value, with: { snapshot in
//                    print("this is value \(snapshot.key)")
//                   
//                })
//            }
//        }

        
        
        DataService.ds.REF_PARENT.observe(.value) { snapshot in
            print(snapshot.value)
        }
        
    }
    
    
        
        
        
//        ref?.child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
//            print("get ChildId")
//            let value = snapshot.value as? NSDictionary
//            self.childId = value?["childId"] as? String ?? ""
//
//            print("reward \(value?["reward"] as? String ?? "")")
//            print("childID \(self.childId)")
//            if let objective = value?["objective"] as? String
//            {
//                print(objective)
//                self.subtitleArray.append(objective)
//            }
//            let rewards = value?["reward"] as? String ?? ""
//            if let reward = value?["reward"] as? Int
//            {
//                print(reward)
//                self.subtitleArray.append(String(reward))
//            }
//        })
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PROFILE")
        self.title = "Profile"
        tableView.delegate = self
        tableView.dataSource = self
        if let user = user {
            email = user.email!
            uid = user.uid
        }
        getKids()
        //self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
        //getTopics()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell")
        cell?.textLabel?.textColor = UIColor.white
        cell?.detailTextLabel?.textColor = UIColor.white
//        cell?.textLabel?.text = profileArray[indexPath.row]
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // in half a second...
//            cell?.detailTextLabel?.text = self.subtitleArray[indexPath.row]
//        }
        return cell!
    }

//
//    func getTopics()
//    {
//        ref = Database.database().reference()
//        print("getTopics")
//        let userID = Auth.auth().currentUser?.uid
//        print("user id is \(String(describing: userID))")
//        ref?.child("parents").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
//            print("get ChildId")
//            let value = snapshot.value as? NSDictionary
//            self.childId = value?["childId"] as? String ?? ""
//
//            print("reward \(value?["reward"] as? String ?? "")")
//            print("childID \(self.childId)")
//            if let objective = value?["objective"] as? String
//            {
//                print(objective)
//                self.subtitleArray.append(objective)
//            }
//            let rewards = value?["reward"] as? String ?? ""
//            if let reward = value?["reward"] as? Int
//            {
//                print(reward)
//                self.subtitleArray.append(String(reward))
//            }
//            self.ref?.child("parents").child(userID!).child(self.childId).observeSingleEvent(of: .value, with: { (snapshot) in
//                // Get user value
//                let value = snapshot.value as? NSDictionary
//
//                if let objective = value?["multiplication"] as? String
//                {
//                    self.subtitleArray.append(objective)
//                }
//                if let objective = value?["addition"] as? String
//                {
//                    self.subtitleArray.append(objective)
//                }
//                if let objective = value?["subtraction"] as? String
//                {
//                    self.subtitleArray.append(objective)
//                }
//                if let objective = value?["division"] as? String
//                {
//                    self.subtitleArray.append(objective)
//                }
//                self.subtitleArray.append(rewards)
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
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if profileArray[indexPath.row] == "Reward Kid"
//        {
//            payKid()
//        }
//    }
//
    
    
    func stringtoDecimal(s: String) -> NSDecimalNumber {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        return formatter.number(from: s) as? NSDecimalNumber ?? 0
    }
    
    func getPaymentItem(cost: String) -> [PKPaymentSummaryItem] {
        let convertedCost = stringtoDecimal(s: cost)
        if convertedCost != 0 {
            let voucher = PKPaymentSummaryItem.init(label: "Reward", amount: convertedCost)
            //print("Reward " + voucher.label + " Amount " + String(describing: voucher.amount))
            return [voucher]
        } else {
            return [PKPaymentSummaryItem.init(label: "INVALID", amount: convertedCost)]
        }
    }
    
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
        let paymentResult = PKPaymentAuthorizationResult(status: .success, errors: [])
        completion(paymentResult)
    }
    
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        controller.dismiss(animated: true, completion: nil)
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

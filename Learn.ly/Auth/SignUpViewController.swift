//
//  SignUpViewController.swift
//  Learn.ly
//
//  Created by Haasith Sanka on 3/31/18.
//  Copyright © 2018 Haasith Sanka. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var repeatPasswordTF: UITextField!
    @IBAction func signupButton(_ sender: Any) {
    Auth.auth().createUser(withEmail: emailTF.text!, password: passwordTF.text!) { (user, error) in
        let password:String = self.passwordTF.text!
        if(error != nil || password.count < 6) {
            print(error.debugDescription)
            if(password.count < 6){
                let alert = UIAlertController(title: "Alert", message: "Password must be at least 6 characters", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            self.performSegue(withIdentifier: "toProfile", sender: nil)
        }
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        signUpButton.layer.cornerRadius = 5
        signUpButton.layer.borderWidth = 1
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
//        if segue.identifier == "extra" {
//            if let destination = segue.destination as? SetupViewController {
//                print("sending \(Int(rewardTF.text!)!) and \(phoneNumTF.text!)")
//                destination.reward = Int(rewardTF.text!)!
//                destination.phoneNumber = phoneNumTF.text!
//            }
//        }
//
        if (segue.identifier == "toExtraInfo") {
            let navController = segue.destination as? UINavigationController
            let controller = navController?.topViewController as? SetupViewController
        }
    }

}
//
//
//    extension UIViewController {
//        func hideKeyboardWhenTappedAround() {
//            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
//            tap.cancelsTouchesInView = false
//            view.addGestureRecognizer(tap)
//        }
//
//        @objc func dismissKeyboard() {
//            view.endEditing(true)
//        }
//    }



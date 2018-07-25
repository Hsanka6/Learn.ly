//
//  LoginViewController.swift
//  Learn.ly
//
//  Created by Haasith Sanka on 3/31/18.
//  Copyright © 2018 Haasith Sanka. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet var signUpButton: UIButton!
    var gradientLayer: CAGradientLayer!
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBAction func loginButtion(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTF.text!, password: passwordTF.text!) { (user, error) in
            if(error != nil)
            {
                print(error.debugDescription)
            }
            else
            {
                print("success")
                self.performSegue(withIdentifier: "login", sender: nil)
            }
            
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        //createGradientLayer()
        signUpButton.layer.cornerRadius = 5
        signUpButton.layer.borderWidth = 1
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1
    }

    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
         createGradientLayer()
    }
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.blue, UIColor.green]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        createGradientLayer()
//    }
//
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension UIView {
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                           blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                           alpha: CGFloat(1.0)
        )
    }
}




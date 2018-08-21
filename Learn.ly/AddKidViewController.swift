//
//  AddKidViewController.swift
//  Learn.ly
//
//  Created by Haasith Sanka on 7/25/18.
//  Copyright © 2018 Haasith Sanka. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class AddKidViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    var ref:DatabaseReference?
    var userRef:DatabaseReference?
    var child: Child?
    var uid:String = ""
    var email:String = ""
    let user = Auth.auth().currentUser
    
    
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var gradeTF: UITextField!
    @IBOutlet var numPointsTF: UITextField!
    @IBOutlet var rewardTF: UITextField!
    @IBOutlet var rightTF: UITextField!
    @IBOutlet var wrongTF: UITextField!
    
    
    @IBAction func saveKid(_ sender: Any) {
        ref = Database.database().reference()
        child = Child(name: nameTF.text!, grade: gradeTF.text!, pointsForRewards: Int(numPointsTF.text!)!, rightVal: Int(rightTF.text!)!, wrongVal: Int(wrongTF.text!)!, reward: rewardTF.text!)
        print("in add kid")
        print(uid)
        DataService.ds.REF_PARENT.child(uid).childByAutoId().setValue(child?.dict);
        performSegue(withIdentifier: "save", sender: nil)
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == gradePickerView{
            return grades.count
        }
        else if pickerView == numPointsPickerView {
            return numPoints.count
        }
        else if pickerView == rightValsPickerView{
            return rightVals.count
        }
        else if pickerView == wrongValsPickerView{
            return wrongVals.count
        }
        return rewards.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == gradePickerView {
            return grades[row]
        } else if pickerView == numPointsPickerView {
            return numPoints[row]
        }
        else if pickerView == wrongValsPickerView {
            return wrongVals[row]
        }
        else if pickerView == rightValsPickerView {
            return rightVals[row]
        }
        return rewards[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == gradePickerView{
            gradeTF.text = grades[row]
        } else if pickerView == numPointsPickerView {
            numPointsTF.text = numPoints[row]
        }
        else if pickerView == wrongValsPickerView {
            wrongTF.text = wrongVals[row]
        }
        else if pickerView == rightValsPickerView {
            rightTF.text = rightVals[row]
        }
        else{
            rewardTF.text = rewards[row]
        }
        self.view.endEditing(true)
        
    }
    
    
    var grades = ["Kindergarten", "1st Grade","2nd Grade","3rd Grade","4th Grade", "5th Grade"]
    
    var numPoints = ["20","50","100"]
    
    var rightVals = ["2","5","10"]
    
    var wrongVals = ["0","1","2","5"]

    var rewards = ["Allowance", "Ice Cream", "Videogame Time"]
    
    
    var gradePickerView = UIPickerView()
    var numPointsPickerView = UIPickerView()
    var rewardPickerView = UIPickerView()
    var rightValsPickerView = UIPickerView()
    var wrongValsPickerView = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        //use guard
        if let user = user {
            email = user.email!
            uid = user.uid
        }
        
        pickerViewSetup()
        
        // Do any additional setup after loading the view.
    }
    
    func pickerViewSetup(){
        gradePickerView.delegate = self
        gradePickerView.dataSource = self
        gradeTF.inputView = gradePickerView
        
        numPointsPickerView.delegate = self
        numPointsPickerView.dataSource = self
        numPointsTF.inputView = numPointsPickerView
        
        rewardPickerView.delegate = self
        rewardPickerView.dataSource = self
        rewardTF.inputView = rewardPickerView
        
        
        wrongValsPickerView.delegate = self
        wrongValsPickerView.dataSource = self
        wrongTF.inputView = wrongValsPickerView
        
        
        rightValsPickerView.delegate = self
        rightValsPickerView.dataSource = self
        rightTF.inputView = rightValsPickerView
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

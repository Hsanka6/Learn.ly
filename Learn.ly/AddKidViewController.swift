//
//  AddKidViewController.swift
//  Learn.ly
//
//  Created by Haasith Sanka on 7/25/18.
//  Copyright © 2018 Haasith Sanka. All rights reserved.
//

import UIKit

class AddKidViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var gradeTF: UITextField!
    @IBOutlet var numPointsTF: UITextField!
    @IBOutlet var rewardTF: UITextField!
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == gradePickerView{
            return grades.count
        }
        else if pickerView == numPointsPickerView {
            return numPoints.count
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
        return rewards[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == gradePickerView{
            gradeTF.text = grades[row]
        } else if pickerView == numPointsPickerView {
            numPointsTF.text = numPoints[row]
        } else{
            rewardTF.text = rewards[row]
        }
        self.view.endEditing(true)
        
    }
    
    
    var grades = ["Kindergarten", "1st Grade","2nd Grade","3rd Grade","4th Grade", "5th Grade"]
    
    var numPoints = ["20","50","100"]

    var rewards = ["Allowance", "Ice Cream", "Videogame Time"]
    
    
    var gradePickerView = UIPickerView()
    var numPointsPickerView = UIPickerView()
    var rewardPickerView = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        gradePickerView.delegate = self
        gradePickerView.dataSource = self
        gradeTF.inputView = gradePickerView
        
        numPointsPickerView.delegate = self
        numPointsPickerView.dataSource = self
        numPointsTF.inputView = numPointsPickerView
        
        rewardPickerView.delegate = self
        rewardPickerView.dataSource = self
        rewardTF.inputView = rewardPickerView
        // Do any additional setup after loading the view.
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

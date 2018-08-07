//
//  MathViewController.swift
//  Learn.ly
//
//  Created by Haasith Sanka on 3/31/18.
//  Copyright © 2018 Haasith Sanka. All rights reserved.
//

import UIKit

class MathViewController: UIViewController {

    @IBOutlet var percentLabel: UILabel!
    @IBOutlet var questionNumberLabel: UILabel!
    @IBAction func nextButton(_ sender: Any) {
//        randomGen()
        randGen()
    }
    @IBOutlet var secondsLabel: UILabel!
    var operation:String = ""
    var timer = Timer()
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    
    var seconds = 100
    var result:Bool = false
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerTF: UITextField!
    var numQuestion:Int = 1
    var numRight:Int = 0
    var first1:Int = 0
    var first2:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFirst()
        updateUI()
        runTimer()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        nextButton.layer.cornerRadius = 5
        nextButton.layer.borderWidth = 1

    }
    
    @IBOutlet var nextButton: UIButton!
    var percent: Double = 0.0
    func updateFirst() {
        first1 = Int(arc4random_uniform(12))
        first2 = Int(arc4random_uniform(12))
    }
    
    func updateUI()
    {
        answerTF.text = ""
        percent = Double(numRight)/10.0 * 100
        percentLabel.text = "\(percent)%"
        if(numQuestion > 10 || seconds == 0) {
            numQuestion = 10
            performSegue(withIdentifier: "toResult", sender: nil)
        }
        questionNumberLabel.text = "Q:\(numQuestion) of 10"
        questionLabel.text = "\(first1)   \(operation)   \(first2)?"
    }
    
    func randGen()
    {
        if numQuestion >= 11
        {
            return
        }
        
        if operation == "+"
        {
            let sum = first1 + first2
            if Int(answerTF.text!)! == sum
            {
                numRight += 1
            }
        }
        else if operation == "-"
        {
            let diff = first1 - first2
            
            if Int(answerTF.text!)! == diff
            {
                numRight += 1
            }
        }
        else if operation == "\u{00f7}"
        {
            let div = first1 / first2
            if Int(answerTF.text!)! == div
            {
                numRight += 1
            }
        }
        else if operation == "X"
        {
            let mult = first1 * first2
            if Int(answerTF.text!)! == mult
            {
                numRight += 1
            }
        }
        
        updateFirst()
        numQuestion += 1
        updateUI()
    }
    
    
    
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(MathViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
        secondsLabel.text = "\(seconds)" //This will update the label.
        if(seconds <= 0)
        {
            performSegue(withIdentifier: "toResult", sender: nil)
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            if let destination = segue.destination as? ResultViewController {
                destination.percent = percent
                destination.operation = operation 
                
            }
        }
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    

}

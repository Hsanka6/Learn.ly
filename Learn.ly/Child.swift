//
//  Child.swift
//  Learn.ly
//
//  Created by Haasith Sanka on 3/31/18.
//  Copyright © 2018 Haasith Sanka. All rights reserved.
//

import Foundation

class Child {
    var grade: String = "";
    var objective: String = "";
    var addition: String = "";
    var subtraction: String = "";
    var multiplication: String = "";
    var division: String = "";
    var topics:String = "";
    
    init(gd: String, obj: String, add: String, sub: String, mult: String, div: String, topic: String) {
        grade = gd
        objective = obj
        addition = add
        subtraction = sub
        multiplication = mult
        division = div
        topics = topic
    }
}

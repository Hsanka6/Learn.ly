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
    var pointsForReward: Int = 0;
    var rightVal: Int = 0;
    var wrongVal: Int = 0;
    var reward: String = "";
    var name: String = "";
    
    init(nm:String,gd: String, numPts: Int, rVal: Int, wVal: Int, rw: String) {
        grade = gd
        name = nm
        rightVal = rVal
        wrongVal = wVal
        reward = rw
        pointsForReward = numPts
    }
    
    var dict:[String:Any] {
        return [
            "name": name ,
            "grade": grade ,
            "right_val": rightVal ,
            "wrong_val": wrongVal,
            "reward": reward,
            "points_for_reward": pointsForReward
        ]
    }
    
}

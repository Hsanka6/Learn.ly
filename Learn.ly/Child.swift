//
//  Child.swift
//  Learn.ly
//
//  Created by Haasith Sanka on 3/31/18.
//  Copyright © 2018 Haasith Sanka. All rights reserved.
//

import Foundation

class Child {
    private var _grade: String!
    private var _pointsForReward: Int!
    private var _rightVal: Int!
    private var _wrongVal: Int!
    private var _reward: String!
    private var _name: String!
    private var _key: String!
    
    
    var grade: String {
        return _grade
    }

    var name: String {
        return _name
    }
    var pointsForReward: Int {
        return _pointsForReward
    }
    var rightVal: Int {
        return _rightVal
    }
    var wrongVal: Int {
        return _wrongVal
    }
    var reward: String {
        return _reward
    }
    var key: String {
        return _key
    }

    
    init(name:String,grade: String, pointsForRewards: Int, rightVal: Int, wrongVal: Int, reward: String) {
        _grade = grade
        _name = name
        _pointsForReward = pointsForRewards
        _rightVal = rightVal
        _wrongVal = wrongVal
        _reward = reward
    }
    
    var dict:[String:Any] {
        return [
            "name": _name ,
            "grade": _grade ,
            "right_val": _rightVal ,
            "wrong_val": _wrongVal,
            "reward": _reward,
            "points_for_reward": _pointsForReward
        ]
    }
    
    init(postKey:String, postDict: Dictionary<String, AnyObject>){
        self._key = postKey
        
        if let grade = postDict["grade"] as? String{
            self._grade = grade
        }
        if let name = postDict["name"] as? String{
            self._name = name
        }
        if let rightVal = postDict["right_val"] as? Int{
            self._rightVal = rightVal
        }
        if let wrongVal = postDict["wrong_val"] as? Int{
            self._wrongVal = wrongVal
        }
        if let reward = postDict["reward"] as? String{
            self._reward = reward
        }
        if let numPoint = postDict["points_for_reward"] as? Int{
            self._pointsForReward = numPoint
        }
    }
    
    
}

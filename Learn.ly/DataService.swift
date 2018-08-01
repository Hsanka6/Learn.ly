//
//  DataService.swift
//  Learn.ly
//
//  Created by Haasith Sanka on 8/1/18.
//  Copyright © 2018 Haasith Sanka. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService{
    static let ds = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_PARENT = DB_BASE.child("parents")
    
    var REF_BASE: DatabaseReference{
        return REF_BASE
    }
    
    var REF_PARENT: DatabaseReference{
        return REF_BASE
    }
}

//
//  TabBarController.swift
//  Learn.ly
//
//  Created by Haasith Sanka on 3/31/18.
//  Copyright © 2018 Haasith Sanka. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    var topicsSelected = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TAB BAR")
        self.navigationItem.hidesBackButton = true
        
    }



}

//
//  Event.swift
//  Tau
//
//  Created by Admin on 25/7/15.
//  Copyright (c) 2015 Tau. All rights reserved.
//

import UIKit

class Event: NSObject {
    var desc: String
    var name: String
    var skills: String
    var num: Int
    var date: String
    
    init(desc: String, name: String, skills: String, num: Int, date: String) {
        self.desc = desc
        self.name = name
        self.skills = skills
        self.num = num
        self.date = date
        super.init()
    }
}
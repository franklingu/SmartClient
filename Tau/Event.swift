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
    var title: String
    var orgName: String
    var skills: String
    var num: Int
    var date: String
    var location: String
    var friendsNum: Int
    var logoName: String
    
    init(title: String, desc: String, orgName: String, skills: String, num: Int, date: String, location: String, friendsNum: Int, logoName: String) {
        self.title = title
        self.desc = desc
        self.orgName = orgName
        self.skills = skills
        self.num = num
        self.date = date
        self.location = location
        self.friendsNum = friendsNum
        self.logoName = logoName
        super.init()
    }
}
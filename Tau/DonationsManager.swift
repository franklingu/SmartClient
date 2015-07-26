//
//  DonationsManager.swift
//  Tau
//
//  Created by Gu Junchao on 26/7/15.
//  Copyright (c) 2015 Tau. All rights reserved.
//

import Foundation

class DonationsManager {
    private static var sharedManager: DonationsManager? = nil
    
    static func getSharedDonationsManager() -> DonationsManager {
        if DonationsManager.sharedManager == nil {
            DonationsManager.sharedManager = DonationsManager()
        }
        
        return DonationsManager.sharedManager!
    }
    
    var donations: [Donation] = []
    
    private init() {
        self.donations = [Donation(), Donation(), Donation(), Donation(), Donation()]
        
        self.donations[0].orgName = "Caregivers' Association of the Mentally-ill"
        self.donations[0].orgImgName = "cami"
        self.donations[0].donationTitle = "CARE for brain"
        self.donations[0].donationDesc = "Donate for mentally ill patients today and start caring for mental health"
        self.donations[0].targetCollection = 200000
        self.donations[0].achievedCollection = 90000
        
        self.donations[1].orgName = "Beyond Social Services"
        self.donations[1].orgImgName = "bss"
        self.donations[1].donationTitle = "Social day donation"
        self.donations[1].donationDesc = "Donate beyond social service and contribute more than social service"
        self.donations[1].targetCollection = 400000
        self.donations[1].achievedCollection = 130000
        
        self.donations[2].orgName = "Singapore Kindness Movement"
        self.donations[2].orgImgName = "skm"
        self.donations[2].donationTitle = "Donate Kindness"
        self.donations[2].donationDesc = "Donate kindness to Kindness Movement and make SG a kinder place"
        self.donations[2].targetCollection = 600000
        self.donations[2].achievedCollection = 530000
        
        self.donations[3].orgName = "SG RedCross"
        self.donations[3].orgImgName = "sg_redcross"
        self.donations[3].donationTitle = "Donate For RedCross"
        self.donations[3].donationDesc = "Your generous contribution to our local humanitarian efforts will be channeled to a wide range of local services to meet the needs of the less privileged within our community. S$20 buys one week of diapers for a resident of the red Cross Home for the Disabled or feeds a family of four for two days."
        self.donations[3].targetCollection = 500000
        self.donations[3].achievedCollection = 330000
        
        self.donations[4].orgName = "SG Heart Foundation"
        self.donations[4].orgImgName = "sg_heart_foundation"
        self.donations[4].donationTitle = "Care for heart"
        self.donations[4].donationDesc = "Care for heart and start now"
        self.donations[4].targetCollection = 4400000
        self.donations[4].achievedCollection = 330000
    }
}

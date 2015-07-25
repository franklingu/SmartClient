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
        self.donations = [Donation(), Donation(), Donation(), Donation()]
    }
}

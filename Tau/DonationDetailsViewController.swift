//
//  DonationDetailsViewController.swift
//  Tau
//
//  Created by Gu Junchao on 26/7/15.
//  Copyright (c) 2015 Tau. All rights reserved.
//

import UIKit

class DonationDetailsViewController: UIViewController {
    var donation: Donation?
    
    @IBOutlet weak var donationTitle: UILabel!
    @IBOutlet weak var orgLogoImg: UIImageView!
    @IBOutlet weak var donationDesc: UILabel!
    @IBOutlet weak var orgName: UILabel!
    @IBOutlet weak var collectionProgress: UIProgressView!
    @IBOutlet weak var collectionTarget: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.donation != nil {
            self.donationTitle.text = self.donation!.donationTitle
            self.orgName.text = self.donation!.orgName
            self.donationDesc.text = self.donation!.donationDesc
            self.collectionProgress.progress = Float(self.donation!.achievedCollection / self.donation!.targetCollection)
            self.collectionTarget.text = String(format:"$%.0f", self.donation!.targetCollection)
        }
    }
}

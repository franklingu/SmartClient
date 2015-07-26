//
//  EventDetailViewController.swift
//  Tau
//
//  Created by Admin on 25/7/15.
//  Copyright (c) 2015 Tau. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var orgLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var friendsLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var skillsLabel: UILabel!
    
    var eventIndex: Int!
    var searchActive: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadDetails()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signupTapped(sender: UIButton) {
        let alert = UIAlertView(title: "Sign Up Successful!", message: nil, delegate: nil, cancelButtonTitle: "OK")
        
        alert.show()
    }
    
    func loadDetails() {
        if !searchActive {
            self.titleLabel.text = eventsData[eventIndex].title
            self.descLabel.text = eventsData[eventIndex].desc
            self.orgLabel.text = eventsData[eventIndex].orgName
            self.dateLabel.text = eventsData[eventIndex].date
            self.numLabel.text = String(eventsData[eventIndex].num)
            self.locationLabel.text = eventsData[eventIndex].location
            self.friendsLabel.text = String(eventsData[eventIndex].friendsNum) + " of your friends has joined this event!"
            self.logoImageView.image = UIImage(named: eventsData[eventIndex].logoName)
            self.skillsLabel.text = eventsData[eventIndex].skills
        } else {
            self.titleLabel.text = eventsFilteredData[eventIndex].title
            self.descLabel.text = eventsFilteredData[eventIndex].desc
            self.orgLabel.text = eventsFilteredData[eventIndex].orgName
            self.dateLabel.text = eventsFilteredData[eventIndex].date
            self.numLabel.text = String(eventsFilteredData[eventIndex].num)
            self.locationLabel.text = eventsFilteredData[eventIndex].location
            self.friendsLabel.text = String(eventsFilteredData[eventIndex].friendsNum) + " of your friends has joined this event!"
            self.logoImageView.image = UIImage(named: eventsFilteredData[eventIndex].logoName)
            self.skillsLabel.text = eventsFilteredData[eventIndex].skills
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

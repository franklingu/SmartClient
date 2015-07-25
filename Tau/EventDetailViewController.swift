//
//  EventDetailViewController.swift
//  Tau
//
//  Created by Admin on 25/7/15.
//  Copyright (c) 2015 Tau. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var orgLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var eventIndex: Int!
    
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
        self.descLabel.text = eventsData[eventIndex].desc
        self.orgLabel.text = eventsData[eventIndex].orgName
        self.dateLabel.text = eventsData[eventIndex].date
        self.numLabel.text = String(eventsData[eventIndex].num)
        self.locationLabel.text = eventsData[eventIndex].location
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

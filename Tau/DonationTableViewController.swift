//
//  DonationTableViewController.swift
//  Tau
//
//  Created by Gu Junchao on 25/7/15.
//  Copyright (c) 2015 Tau. All rights reserved.
//

import UIKit

class DonationTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DonationCell") as! UITableViewCell
        return cell
    }
}

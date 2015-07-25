//
//  DonationTableViewController.swift
//  Tau
//
//  Created by Gu Junchao on 25/7/15.
//  Copyright (c) 2015 Tau. All rights reserved.
//

import UIKit

class DonationTableViewController: UITableViewController, UISearchBarDelegate {
    var donations: [Donation] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Search"
        self.donations = [Donation(), Donation(), Donation()]
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.view.endEditing(true)
        searchBar.text = ""
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.donations.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DonationCell") as! DonationTableViewCell
        let donation = self.donations[indexPath.row]
        
        cell.orgName.text = donation.orgName
        cell.donationTitle.text = donation.donationTitle
        cell.targetProgress.progress = Float(donation.achievedCollection / donation.targetCollection)
        cell.targetText.text = String(format:"$%.0f", donation.targetCollection)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let donation = self.donations[indexPath.row]
        self.performSegueWithIdentifier("pushToDonationFromTable", sender: donation)
    }
}

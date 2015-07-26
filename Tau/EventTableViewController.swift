//
//  EventTableViewController.swift
//  Tau
//
//  Created by Admin on 25/7/15.
//  Copyright (c) 2015 Tau. All rights reserved.
//

import UIKit

class EventTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var searchActive: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Search"
        loadEventsData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
        self.view.endEditing(true)
        self.tableView.reloadData()
        searchBar.text = ""
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if count(searchText) == 0 {
            searchActive = false;
        } else {
            eventsFilteredData.removeAll(keepCapacity: false)
            searchActive = true;
            searchFor(searchText)
        }
        
        self.tableView.reloadData()
    }
    
    func searchFor(searchText: String) {
        for i in 0..<eventsData.count {
            if match(searchText, index: i) {
                eventsFilteredData.append(eventsData[i])
            }
        }
    }
    
    func match(searchText: String, index: Int) -> Bool {
        let lowerSearchText = searchText.lowercaseString
        if eventsData[index].desc.lowercaseString.rangeOfString(lowerSearchText) != nil {
            return true
        }
        if eventsData[index].skills.lowercaseString.rangeOfString(lowerSearchText) != nil {
            return true
        }
        if eventsData[index].orgName.lowercaseString.rangeOfString(lowerSearchText) != nil {
            return true
        }
        if eventsData[index].location.lowercaseString.rangeOfString(lowerSearchText) != nil {
            return true
        }
        
        return false
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if searchActive {
            return eventsFilteredData.count
        } else {
            return eventsData.count
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EventCell", forIndexPath: indexPath) as! EventTableViewCell

        // Configure the cell...
        if searchActive {
            let event = eventsFilteredData[indexPath.row] as Event
            cell.descLabel.text = event.title
            cell.orgLabel.text = event.orgName
            cell.dateLabel.text = event.date
            cell.numLabel.text = String(event.num)
            cell.friendsNumLabel.text = String(event.friendsNum)
            cell.iconImageView.image = UIImage(named: event.logoName)
            
            return cell
        } else {
            let event = eventsData[indexPath.row] as Event
            cell.descLabel.text = event.title
            cell.orgLabel.text = event.orgName
            cell.dateLabel.text = event.date
            cell.numLabel.text = String(event.num)
            cell.friendsNumLabel.text = String(event.friendsNum)
            cell.iconImageView.image = UIImage(named: event.logoName)
            
            return cell
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowEventDetail" {
            let cell = sender as? UITableViewCell
            let indexPath: NSIndexPath = self.tableView.indexPathForCell(cell!)!
            let vc = segue.destinationViewController as? EventDetailViewController
            vc?.eventIndex = indexPath.row
            vc?.searchActive = self.searchActive
        }
    }
    
    func loadEventsData() {
        eventsData = [Event(title: "Endless Love", desc: "This is a special fund raising event benefitting Action for AIDS (AFA) Singapore. Proceeds from this event will be used to fund educational, care and welfare programmes. The event will mobilise business and community support to stop the spread of HIV infection and AIDS and to lessen the impact of the infection in Singapore.", orgName: "Action For AIDS (Singapore)", skills: "Fund Raiser", num: 50, date: "25 July", location: "Ang Mo Kio", friendsNum: 6, logoName: "afa"), Event(title: "Volunteer as Mentor", desc: "Babes Pregnancy Crisis Support Limited envisions a more inclusive society where every pregnant teenager needing support will not feel estranged or marginalised.", orgName: "Babes", skills: "Mentor, Mother", num: 0, date: "Long term", location: "26 Jalan Klinik, #01-42/52, Singapore 160026", friendsNum: 0, logoName: "babes"), Event(title: "Volunteer for Outreach", desc: "Babes Pregnancy Crisis Support Limited envisions a more inclusive society where every pregnant teenager needing support will not feel estranged or marginalised", orgName: "Babes", skills: "Publicity", num: 0, date: "Long term", location: "26 Jalan Klinik, #01-42/52, Singapore 160026", friendsNum: 0, logoName: "babes"), Event(title: "Refurbishing 2 Homes", desc: "Blessed Grace Social Services’ members have been helping and assisting the poor and elderly in Chai Chee, Block 23/24 since 2010.", orgName: "Blessed Grace Social Services", skills: "Shift Household items", num: 8, date: "1 Aug", location: "Chai Chee Blk 23/24, Bedok", friendsNum: 1, logoName: "bless"), Event(title: "Group Sharing Sessions", desc: "Blessed Grace Social Services launched the “Narcotics Addiction Support Group” on 9th April 2015. We started with 20 members, half of which are recovering addicts and the other half counsellors and volunteers. It was a good start and we had sharing, testimonies and prayers.", orgName: "Blessed Grace Social Services", skills: "Sharing, Councelling", num: 5, date: "Weekly Thursdays, 7:30pm to 9:30pm", location: "18, Arumugam Road. #05-01, Antioch@MacPherson", friendsNum: 0, logoName: "bless"), Event(title: "NUSSU Flag&Rag 2015", desc: "", orgName: "NUSSU", skills: "", num: 30, date: "7 Aug", location: "The Float @ Marina Bay", friendsNum: 2, logoName: "rag"), Event(title: "Blood Donation Drive", desc: "", orgName: "RedCross Youth", skills: "", num: 10, date: "26-29 Aug", location: "NUS YIH", friendsNum: 3, logoName: "redcross"), Event(title: "Supporting animal rights and welfare", desc: "", orgName: "Acres", skills: "", num: 20, date: "11 Nov", location: "ACRES Wildlife Rescue Centre at 91 Jalan Lekar", friendsNum: 1, logoName: "animal")]
        self.tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  EventTableViewController.swift
//  Tau
//
//  Created by Admin on 25/7/15.
//  Copyright (c) 2015 Tau. All rights reserved.
//

import UIKit

class EventTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return eventsData.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EventCell", forIndexPath: indexPath) as! EventTableViewCell

        // Configure the cell...
        let event = eventsData[indexPath.row] as Event
        cell.descLabel.text = event.desc
        cell.orgLabel.text = event.orgName
        cell.dateLabel.text = event.date
        cell.numLabel.text = String(event.num)
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowEventDetail" {
            let cell = sender as? UITableViewCell
            let indexPath: NSIndexPath = self.tableView.indexPathForCell(cell!)!
            let vc = segue.destinationViewController as? EventDetailViewController
            vc?.eventIndex = indexPath.row
        }
    }
    
    func loadEventsData() {
        eventsData = [Event(desc: "NUSSU Flag&Rag 2015", orgName: "NUSSU", skills: "", num: 30, date: "7 Aug", location: "The Float @ Marina Bay"), Event(desc: "Blood Donation Drive", orgName: "Red Cross Youth-NUS Chapter", skills: "", num: 10, date: "26-29 Aug", location: "NUS YIH"), Event(desc: "Supporting animal rights and welfare", orgName: "Acres", skills: "", num: 20, date: "11 Nov", location: "ACRES Wildlife Rescue Centre at 91 Jalan Lekar")]
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

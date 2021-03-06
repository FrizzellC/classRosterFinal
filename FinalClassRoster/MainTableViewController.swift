//
//  MainTableViewController.swift
//  FinalClassRoster
//
//  Created by chantel Frizzell on 12/10/14.
//  Copyright (c) 2014 Training. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var roster: NSMutableArray = NSMutableArray()
    var personImage = UIImageView()
    var userDefaults:NSUserDefaults = NSUserDefaults()
    
    override func viewDidAppear(animated: Bool) {
        //^called every time the view appears
        super.viewDidAppear(animated)
        
        var userDefaults:NSUserDefaults = NSUserDefaults()
        var rosterFromUserDefaults:NSMutableArray? = userDefaults.objectForKey("roster") as? NSMutableArray
        
        if ((rosterFromUserDefaults) != nil) {
            roster = rosterFromUserDefaults!
        }
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            println("view did load")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roster.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PERSON_CELL", forIndexPath: indexPath) as PersonTableViewCell

        // Configure the cell
        var person:NSDictionary = roster.objectAtIndex(indexPath.row) as NSDictionary
        
        cell.firstNameInCell.text = person.valueForKey("firstName") as? String
        
        cell.lastnameInCell.text = person.valueForKey("lastName") as? String
        
        //call out data for ease of use
        var imageData = person.valueForKey("image") as NSData
        
        //convert data to UIImage
        var newImage = UIImage(data: imageData)
        
        //set new image
        cell.imageInCell.image = newImage!

        return cell
    }
    
    //allow editing the rows
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    // delete or add rows
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            println("delete?")
            // Delete the row from the data source
            roster.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            println("object removed")
            tableView.reloadData()
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        tableView.reloadData()
        println("row deleted")
    }
    

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

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //if a cell is clicked
        if (segue.identifier == "segueToDVC") {
            var selectedIndexPath:NSIndexPath = self.tableView.indexPathForSelectedRow()!
            var detailViewController:DetailViewController = segue.destinationViewController as DetailViewController
            detailViewController.selectedPersonData = roster.objectAtIndex(selectedIndexPath.row) as NSDictionary
        }
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
}

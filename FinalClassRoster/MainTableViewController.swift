//
//  MainTableViewController.swift
//  FinalClassRoster
//
//  Created by chantel Frizzell on 12/10/14.
//  Copyright (c) 2014 Training. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var people:NSMutableArray = NSMutableArray()
    
    @IBOutlet weak var firstNameInCell: UILabel!
    @IBOutlet weak var lastNameInCell: UILabel!
    
    override func viewDidAppear(animated: Bool) {
        //^called every time the view appears
        super.viewDidAppear(animated)
        
        var userDefaults:NSUserDefaults = NSUserDefaults()
        var rosterFromUserDefaults:NSMutableArray? = userDefaults.objectForKey("roster") as? NSMutableArray
        
        if ((rosterFromUserDefaults) != nil) {
            people = rosterFromUserDefaults!
        }
        
        self.tableView.reloadData()
        
    }
    
    
        override func viewDidLoad() {
        super.viewDidLoad()

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
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    @IBAction func addButtonClicked(sender: AnyObject) {
    
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PERSON_CELL", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell
        var person:NSDictionary = people.objectAtIndex(indexPath.row) as NSDictionary
        
        var firstNameInCell = UILabel()
        firstNameInCell.textAlignment = NSTextAlignment.Center
        firstNameInCell.text = person.objectForKey("roster") as? String

        var lastNameInCell = UILabel()
        lastNameInCell.textAlignment = NSTextAlignment.Center
        lastNameInCell.text = person.objectForKey("roster") as? String
        
        var imageInCell = UIImageView()
        imageInCell.image = UIImage(contentsOfFile: "cameraImage")
        return cell
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

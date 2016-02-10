//
//  TableViewController.swift
//  mapPlacemarks
//
//  Created by Dustin M on 2/6/16.
//  Copyright © 2016 Vento. All rights reserved.
//

import UIKit

var places = [Dictionary<String,String>()]

var activePlace = -1

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if places.count == 1 {
            places.removeAtIndex(0) //removes the empty cell in the places Dictionary that by default cannot be empty
            places.append(["name":"Epcot Center", "lat":"28.375271","lon":"-81.549430"])
        }

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return places.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = places[indexPath.row]["name"]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        //centers the map on the user selected place in the Root VC
        
        activePlace = indexPath.row
        return indexPath
        
    }
    


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //resets the map to center on the user location when they press the + button
        
        if segue.identifier == "newPlace" {
            
            activePlace = -1
            
        }
        
    }

    override func viewWillAppear(animated: Bool) {
    //refreshes tableView when transitiong between the Map VC and the Root VC
        tableView.reloadData()

    }

}
/*

import UIKit

var places = [Dictionary<String,String>()]

var activePlace = -1

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if places.count == 1 {
            
            places.removeAtIndex(0)
            
            places.append(["name":"Taj Mahal","lat":"27.175277","lon":"78.042128"])
            
        }
        
        if NSUserDefaults.standardUserDefaults().objectForKey("activePlace") != nil {
            
            places = NSUserDefaults.standardUserDefaults().objectForKey("activePlace") as! [Dictionary]
            
        }
        
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
        
        return places.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        
        cell.textLabel?.text =  places[indexPath.row]["name"]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        activePlace = indexPath.row
        
        return indexPath
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "newPlace" {
            
            activePlace = -1
            
        }
        
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        
        tableView.reloadData()
        
    }
    
    
}
*/

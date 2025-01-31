//
//  ReposTableViewController.swift
//  GithubFriends
//
//  Created by Shannon Armon on 5/13/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    
    
    var friendInfo: [String: AnyObject?]! {
    
        didSet {
        
            navigationItem.title = "Repos"
            navigationItem.prompt = friendInfo["name"] as? String
            
            let reposEndpoint = friendInfo["repos_url"] as! String
            
            if let reposInfo = GithubRequest.getInfoWithEnpoint(reposEndpoint) as? [[String:AnyObject]] {
                
                repos = reposInfo
                tableView.reloadData()
                
            
            }
            
            
//            if let friendInfo = GithubRequest.getInfoWithEnpoint(endpoint) as? [String:AnyObject?]{
//                
//                println(friendInfo)                   <===reference
//                
//                friends.insert(friendInfo, atIndex: 0)
//                tableView.reloadData()
//            }
        
        }
        
    }
    
    var repos: [[String:AnyObject]] = []

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

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 0
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return repos.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("repoCell", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        
        cell.textLabel?.text = repos[indexPath.row]["name"] as? String

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

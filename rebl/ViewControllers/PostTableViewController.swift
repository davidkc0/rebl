//
//  PostTableViewController.swift
//  rebl
//
//  Created by David Ciaffoni on 7/7/16.
//  Copyright © 2016 David Ciaffoni. All rights reserved.
//

import UIKit
import Parse

class PostTableViewController: UITableViewController {
    
    var postsArray: [Post] = []
    
    
    @IBAction func loginButton(sender: AnyObject) {
        self.performSegueWithIdentifier("login", sender: self)
    }

    
    @IBAction func unwindToPostScreen(segue:UIStoryboardSegue) {
//        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
        
    override func viewDidAppear(animated: Bool) {
        
        
    }
    
    override func viewWillAppear(animated: Bool) {

        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.alpha = 1
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.setNavigationBarHidden(false, animated: false)

        let getPosts = PFQuery(className: "Post")
        
        getPosts.findObjectsInBackgroundWithBlock { (objects, error) -> Void in

            for post in objects! {
                self.postsArray.append(Post(parseObject: post))
            }
            
            self.tableView.reloadData()
        }
    

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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return postsArray.count
    }
    
    

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("postCell", forIndexPath: indexPath) as! PostTableViewCell

        cell.postUsernameLabel.text = ""
        
        let post = postsArray[indexPath.row]
        
        cell.postTitleLabel.text = post.title
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .LongStyle
        dateFormatter.timeStyle = .ShortStyle
        let dateString = dateFormatter.stringFromDate(post.timeCreated)
        
        cell.postTimeLabel.text = dateString
        

        post.user.fetchInBackgroundWithBlock { (object, error) in
            let user = object as! PFUser
            
            cell.postUsernameLabel.text = user.username
        }
        
        return cell
    }
 

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        performSegueWithIdentifier("webviewSegue", sender: self)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "webviewSegue" {
            
            let index = tableView.indexPathForSelectedRow
            let currPost = postsArray[(index?.row)!]
            
            let webViewController = segue.destinationViewController as! WebViewController
            webViewController.currentPost = currPost
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

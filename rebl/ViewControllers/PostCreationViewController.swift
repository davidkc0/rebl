//
//  PostCreationViewController.swift
//  rebl
//
//  Created by David Ciaffoni on 7/7/16.
//  Copyright © 2016 David Ciaffoni. All rights reserved.
//

import UIKit
import Parse

class PostCreationViewController: UIViewController {

    @IBOutlet weak var urlTextBox: UITextField!
    @IBOutlet weak var postTitleTextBox: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBAction func submitButton(sender: AnyObject) {
        let postObject = PFObject(className: "Post")
        
        postObject["url"] = urlTextBox.text
        postObject["title"] = postTitleTextBox.text
        
        postObject["user"] = PFUser.currentUser()
        
        postObject.saveInBackgroundWithBlock(nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

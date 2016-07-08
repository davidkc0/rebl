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
    
    
    @IBAction func tapOutside(sender: AnyObject) {
        
        self.view.endEditing(true)
    }
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0,150,150)) as UIActivityIndicatorView
    
    @IBAction func submitButton(sender: AnyObject) {
        let postObject = PFObject(className: "Post")
        
        postObject["url"] = urlTextBox.text
        postObject["title"] = postTitleTextBox.text
        
        postObject["user"] = PFUser.currentUser()
        
        postObject.saveInBackgroundWithBlock(nil)
        
        let url = self.urlTextBox.text
        let postTitle = self.postTitleTextBox.text
        
        if (url?.utf16.count < 7 || postTitle!.utf16.count < 5) {
            
            let alert = UIAlertView(title: "invaild", message: "please enter a vaild url and/or a post title that is greater then 5 characters", delegate: self, cancelButtonTitle: "okay")
            
            alert.show()
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.alpha = 0
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

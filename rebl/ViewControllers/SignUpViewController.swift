//
//  SignUpViewController.swift
//  rebl
//
//  Created by David Ciaffoni on 7/7/16.
//  Copyright © 2016 David Ciaffoni. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
//    @IBOutlet var tapScreen: UITapGestureRecognizer!
    
    @IBAction func tapScreen(sender: AnyObject) {
        
        self.view.endEditing(true)
        
    }
    
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0,150,150)) as UIActivityIndicatorView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.navigationBar.alpha = 0
        
        self.actInd.center = self.view.center
        self.actInd.hidesWhenStopped = true
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(self.actInd)
        
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
    @IBAction func signupAction(sender: AnyObject) {
        
            var email = self.emailField.text
            var username = self.usernameField.text
            var password = self.passwordField.text
            
            if (username?.utf16.count < 5 || password!.utf16.count < 5) {
                
                var alart = UIAlertView(title: "invaild", message: "username and password must be greater then 5 characters", delegate: self, cancelButtonTitle: "okay")
                alart.show()
                
            }else if (email?.utf16.count < 8) {
                var alart = UIAlertView(title: "invaild", message: "please enter a vaild email", delegate: self, cancelButtonTitle: "okay")
                alart.show()
                
            }else {
                self.actInd.stopAnimating()
                
                var newUser = PFUser()
                newUser.email = email
                newUser.username = username
                newUser.password = password
                
                newUser.signUpInBackgroundWithBlock({(succeed, error ) -> Void in
                    
                    self.actInd.stopAnimating()
                    if ((error) != nil) {
                        var alart = UIAlertView(title: "error", message: "\(error)", delegate: self, cancelButtonTitle: "okay")
                        alart.show()
                    }else{
                        var alart = UIAlertView(title: "succuess", message: "signed up", delegate: self, cancelButtonTitle: "okay")
                        alart.show()
                    }
                
                })
                
        
        
        
        
        
        
    }

    
   // @IBAction func alreadyMemberAction(sender: AnyObject) {
        //self.performSegueWithIdentifier("login", sender: self)
    }
    
    
}


//
//  SignUpViewController.swift
//  rebl
//
//  Created by David Ciaffoni on 7/7/16.
//  Copyright © 2016 David Ciaffoni. All rights reserved.
//

import UIKit
import Parse
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}


class SignUpViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
//    @IBOutlet var tapScreen: UITapGestureRecognizer!
    
    @IBAction func tapScreen(_ sender: AnyObject) {
        
        self.view.endEditing(true)
        
    }
    
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0,y: 0,width: 150,height: 150)) as UIActivityIndicatorView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.navigationBar.alpha = 0
        
        self.actInd.center = self.view.center
        self.actInd.hidesWhenStopped = true
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
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
    @IBAction func signupAction(_ sender: AnyObject) {
        
            let email = self.emailField.text
            let username = self.usernameField.text
            let password = self.passwordField.text
            
            if (username?.utf16.count < 5 || password!.utf16.count < 5) {
                
                let alart = UIAlertView(title: "invaild", message: "username and password must be greater then 5 characters", delegate: self, cancelButtonTitle: "okay")
                alart.show()
                
            } else if (email?.utf16.count < 8) {
                let alart = UIAlertView(title: "invaild", message: "please enter a vaild email", delegate: self, cancelButtonTitle: "okay")
                alart.show()
                
            } else {
                self.actInd.stopAnimating()
                
                let newUser = PFUser()
                newUser.email = email
                newUser.username = username
                newUser.password = password
                
                newUser.signUpInBackground(block: {(succeed, error ) -> Void in
                    
                    self.actInd.stopAnimating()
                    if ((error) != nil) {
                        let alert = UIAlertView(title: "error", message: "\(error)", delegate: self, cancelButtonTitle: "okay")
                        alert.show()
                    } else {
                        let alert = UIAlertView(title: "succuess", message: "signed up", delegate: self, cancelButtonTitle: "okay")
                        alert.show()
                    }
                
                })
            
        
        }
   // @IBAction func alreadyMemberAction(sender: AnyObject) {
        //self.performSegueWithIdentifier("login", sender: self)
    }
    
    
}


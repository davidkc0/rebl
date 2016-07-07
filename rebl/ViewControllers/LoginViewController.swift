//
//  LoginViewController.swift
//  rebl
//
//  Created by David Ciaffoni on 7/7/16.
//  Copyright © 2016 David Ciaffoni. All rights reserved.
//

import UIKit
import Parse


class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func tapScreen(sender: AnyObject) {
        
        self.view.endEditing(true)
    }
    
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0,150,150))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
//        self.navigationController?.navigationBar.frame.size.height = 0
        self.navigationController?.navigationBar.alpha = 0
        
        
        self.actInd.center = self.view.center
        self.actInd.center.y = self.view.frame.size.height * (3/4)
        self.actInd.color = UIColor.whiteColor()
        self.actInd.tintColor = UIColor.whiteColor()
        
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
    
    //MARK: Actions
    
    @IBAction func loginAction(sender: AnyObject) {
        
        passwordField.resignFirstResponder()
        
        var username = self.usernameField.text
        var password = self.passwordField.text
        
        
        
        if (username?.utf16.count < 5 || password!.utf16.count < 5) {
            
            var alert = UIAlertView(title: "invaild", message: "username and password must be greater then 5 characters", delegate: self, cancelButtonTitle: "okay")
            
            alert.show()
            
        } else {
            
            self.actInd.startAnimating()
            
            PFUser.logInWithUsernameInBackground(username!, password: password!, block: { (user, error) ->
                Void in
                
                self.actInd.stopAnimating()
                
                if ((user) != nil){
                    let alert = UIAlertView(title: "success", message: "logged in", delegate: self, cancelButtonTitle: "okay")
                    alert.show()
                } else {
                    let alert = UIAlertView(title: "error", message: "\(error)", delegate: self, cancelButtonTitle: "okay")
                    alert.show()
                    
                }
                
            })
            
            
        }
        
    
    }
    
   
    @IBAction func signupAction(sender: AnyObject) {
        self.performSegueWithIdentifier("signup", sender: self)
    }

    
    @IBAction func unwindToLogInScreen(segue:UIStoryboardSegue) {
    }
    
}

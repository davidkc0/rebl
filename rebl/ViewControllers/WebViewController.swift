//
//  WebViewController.swift
//  
//
//  Created by Vince on 7/7/16.
//
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var currentPost: Post! = nil
    
    override func viewDidLoad() {
        
        navigationController?.navigationBar.alpha = 0
        
        super.viewDidLoad()

        NSURLCache.sharedURLCache().removeAllCachedResponses()
        NSURLCache.sharedURLCache().diskCapacity = 0
        NSURLCache.sharedURLCache().memoryCapacity = 0
//        print(currentPost.url)
        print(beautifyLink(currentPost.url))
        let theURL = NSURL(string: beautifyLink(currentPost.url))
        let theRequest = NSURLRequest(URL: theURL!)
        webView.loadRequest(theRequest)
        
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

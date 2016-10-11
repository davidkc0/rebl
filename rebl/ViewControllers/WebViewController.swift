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

        URLCache.shared.removeAllCachedResponses()
        URLCache.shared.diskCapacity = 0
        URLCache.shared.memoryCapacity = 0
//        print(currentPost.url)
        print(beautifyLink(currentPost.url))
        let theURL = URL(string: beautifyLink(currentPost.url))
        let theRequest = URLRequest(url: theURL!)
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

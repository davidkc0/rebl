//
//  Post.swift
//  rebl
//
//  Created by Vince on 7/7/16.
//  Copyright © 2016 David Ciaffoni. All rights reserved.
//

import Foundation
import Parse


class Post {
    var title: String = ""
    var url: String = ""
    var user: PFUser
    var timeCreated: NSDate!
    
    init(parseObject: PFObject) {
        
        self.title = parseObject["title"] as! String
        self.url = parseObject["url"] as! String
        self.timeCreated = parseObject.createdAt
        
        self.user = parseObject["user"] as! PFUser
        
//        user.fetchInBackgroundWithBlock { (newUser, error) in
//            let theUser = newUser as! PFUser
//            self.user = theUser.username!
//            
//            
//        }
        
//        user.fetchIfNeededInBackgroundWithBlock { (<#PFObject?#>, <#NSError?#>) in
//            <#code#>
//        }
        

        
    }
}
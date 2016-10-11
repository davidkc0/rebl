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
    var timeCreated: Date!
    
    var upVotes: String = ""
    
    init(parseObject: PFObject) {
        
        self.title = parseObject["title"] as! String
        self.url = parseObject["url"] as! String
        self.timeCreated = parseObject.createdAt
        
        self.user = parseObject["user"] as! PFUser
        
        if self.title == "The Boss" {
            self.upVotes = "56,234,193"
        } else {
            self.upVotes = (String(Int(arc4random()) % 100))
        }
        

        
    }
}

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
    var user: String = ""
    
    init(parseObject: PFObject) {
        
        self.title = parseObject["title"] as! String
        self.url = parseObject["url"] as! String
//        self.user = parseObject["user"] as! String
    }
}
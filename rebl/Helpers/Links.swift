//
//  Links.swift
//  rebl
//
//  Created by Vince on 7/8/16.
//  Copyright © 2016 David Ciaffoni. All rights reserved.
//

import Foundation
//import UIKit

func beautifyLink(link: String) -> String {
    
    let firstIndex: String.Index = link.startIndex.advancedBy(4)
    let first4 = link.substringToIndex(firstIndex)
    
    let lastIndex: String.Index = link.endIndex.advancedBy(-4)
    let last4 = link.substringFromIndex(lastIndex)
    
    var inBetween = link.substringFromIndex(firstIndex)
    
    let newLastIndex: String.Index = inBetween.endIndex.advancedBy(-4)
    inBetween = inBetween.substringToIndex(newLastIndex)
    
    
    if first4 == "www." {
        if last4 == ".com" {
            
            return ("http://" + link)
        }
    } else {
        return ("http://www." + link)
    }
    
    return link
}

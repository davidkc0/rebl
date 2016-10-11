//
//  Links.swift
//  rebl
//
//  Created by Vince on 7/8/16.
//  Copyright © 2016 David Ciaffoni. All rights reserved.
//

import Foundation
//import UIKit

func beautifyLink(_ link: String) -> String {
    
    let firstIndex: String.Index = link.characters.index(link.startIndex, offsetBy: 4)
    let first4 = link.substring(to: firstIndex)
    
    let lastIndex: String.Index = link.characters.index(link.endIndex, offsetBy: -4)
    let last4 = link.substring(from: lastIndex)
    
    var inBetween = link.substring(from: firstIndex)
    
    let newLastIndex: String.Index = inBetween.characters.index(inBetween.endIndex, offsetBy: -4)
    inBetween = inBetween.substring(to: newLastIndex)
    
    
    if first4 == "www." {
        if last4 == ".com" {
            
            return ("http://" + link)
        }
    } 
    
    return link
}

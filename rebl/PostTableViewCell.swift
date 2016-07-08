//
//  PostTableViewCell.swift
//  rebl
//
//  Created by Vince on 7/7/16.
//  Copyright © 2016 David Ciaffoni. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postScoreLabel: UILabel!
    @IBOutlet weak var postTimeLabel: UILabel!
    @IBOutlet weak var postUsernameLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

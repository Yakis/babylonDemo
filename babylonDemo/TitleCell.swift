//
//  TitleCell.swift
//  babylonDemo
//
//  Created by yakis on 12/01/2017.
//  Copyright © 2017 com.yakis. All rights reserved.
//

import UIKit

class TitleCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var commentsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    func setupCell (title: String, userName: String, commentsCount: Int) {
        self.titleLabel.text = title
        self.userNameLabel.text = "\(LabelKeys.author)\(userName)"
        self.commentsLabel.text = "\(LabelKeys.comments)\(commentsCount)"
        
    }
    
    
    
}

//
//  BodyCell.swift
//  babylonDemo
//
//  Created by yakis on 12/01/2017.
//  Copyright © 2017 com.yakis. All rights reserved.
//

import UIKit

class BodyCell: UITableViewCell {

    
    @IBOutlet weak var bodyLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupCell (text: String) {
        self.bodyLabel.text = text
    }
    
}

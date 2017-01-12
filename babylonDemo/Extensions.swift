//
//  Extensions.swift
//  babylonDemo
//
//  Created by yakis on 12/01/2017.
//  Copyright © 2017 com.yakis. All rights reserved.
//

import Foundation


extension String {
    func capitalizingFirstLetter() -> String {
        let first = String(characters.prefix(1)).capitalized
        let other = String(characters.dropFirst())
        return first + other
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

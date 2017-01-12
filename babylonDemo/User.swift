//
//  User.swift
//  babylonDemo
//
//  Created by yakis on 12/01/2017.
//  Copyright © 2017 com.yakis. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    
    private(set) dynamic var id = 0
    private(set) dynamic var name = leaveEmpty
    private(set) dynamic var username = leaveEmpty
    private(set) dynamic var email = leaveEmpty
    
    /**
     Override Object.primaryKey() to set the model’s primary key. Declaring a primary key allows objects to be looked up and updated efficiently and enforces uniqueness for each value.
     */
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(json: JSON) {
        self.init()
        self.id = json[UserKeys.id] as! Int
        self.name = json[UserKeys.name] as? String ?? leaveEmpty
        self.username = json[UserKeys.username] as? String ?? leaveEmpty
        self.email = json[UserKeys.email] as? String ?? leaveEmpty

    }
}

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
    private(set) dynamic var name = ""
    private(set) dynamic var username = ""
    private(set) dynamic var email = ""
    
    /**
     Override Object.primaryKey() to set the model’s primary key. Declaring a primary key allows objects to be looked up and updated efficiently and enforces uniqueness for each value.
     */
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(id: Int, name: String, username: String, email: String) {
        self.init()
        self.id = id
        self.name = name
        self.username = username
        self.email = email
    }
}

//
//  Comment.swift
//  babylonDemo
//
//  Created by yakis on 12/01/2017.
//  Copyright © 2017 com.yakis. All rights reserved.
//

import Foundation
import RealmSwift

class Comment: Object {
    
    private(set) dynamic var id = 0
    private(set) dynamic var postId = 0
    private(set) dynamic var name = ""
    private(set) dynamic var body = ""
    private(set) dynamic var email = ""
    
    /**
     Override Object.primaryKey() to set the model’s primary key. Declaring a primary key allows objects to be looked up and updated efficiently and enforces uniqueness for each value.
     */
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(id: Int, postId: Int, name: String, body: String, email: String) {
        self.init()
        self.id = id
        self.postId = postId
        self.name = name
        self.body = body
        self.email = email
    }
}

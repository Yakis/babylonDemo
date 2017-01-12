//
//  Post.swift
//  babylonDemo
//
//  Created by yakis on 12/01/2017.
//  Copyright © 2017 com.yakis. All rights reserved.
//

import Foundation
import RealmSwift

class Post: Object {
    
    private(set) dynamic var id = 0
    private(set) dynamic var userId = 0
    private(set) dynamic var title = leaveEmpty
    private(set) dynamic var body = leaveEmpty
    
    /**
     Override Object.primaryKey() to set the model’s primary key. Declaring a primary key allows objects to be looked up and updated efficiently and enforces uniqueness for each value.
     */
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(json: JSON) {
        self.init()
        self.userId = json[PostKeys.userId] as? Int ?? 0
        self.id = json[PostKeys.id] as? Int ?? 0
        self.title = (json[PostKeys.title] as? String)?.capitalizingFirstLetter() ?? leaveEmpty
        self.body = json[PostKeys.body] as? String ?? leaveEmpty
    }
}

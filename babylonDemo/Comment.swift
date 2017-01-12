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
    private(set) dynamic var name = leaveEmpty
    private(set) dynamic var body = leaveEmpty
    private(set) dynamic var email = leaveEmpty
    
    /**
     Override Object.primaryKey() to set the model’s primary key. Declaring a primary key allows objects to be looked up and updated efficiently and enforces uniqueness for each value.
     */
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(json: JSON) {
        self.init()
         self.id = json[CommentKeys.id] as! Int
         self.postId = json[CommentKeys.postId] as! Int
         self.name = json[CommentKeys.name] as? String ?? leaveEmpty
         self.body = json[CommentKeys.body] as? String ?? leaveEmpty
         self.email = json[CommentKeys.email] as? String ?? leaveEmpty
    }
}

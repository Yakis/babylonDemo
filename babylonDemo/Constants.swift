//
//  Constants.swift
//  babylonDemo
//
//  Created by yakis on 11/01/2017.
//  Copyright © 2017 com.yakis. All rights reserved.
//

import Foundation
import UIKit

struct Shortcuts {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
}


struct Endpoints {
    static let postsList = "http://jsonplaceholder.typicode.com/posts"
    static let users = "http://jsonplaceholder.typicode.com/users"
    static let comments = "http://jsonplaceholder.typicode.com/comments"
    
}


struct EntityNames {
    static let Post = "Post"
    static let User = "User"
    static let Comment = "Comment"
}


struct Colors {
    static let deepPurple = UIColor(red: 145/255, green: 19/255, blue: 254/255, alpha: 1.0)
}




let leaveEmpty = ""

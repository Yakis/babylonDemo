//
//  Post+CoreDataProperties.swift
//  babylonDemo
//
//  Created by yakis on 11/01/2017.
//  Copyright © 2017 com.yakis. All rights reserved.
//

import Foundation
import CoreData


extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post");
    }

    @NSManaged public var body: String?
    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var userId: Int64
    @NSManaged public var toComment: NSSet?
    @NSManaged public var toUser: User?

}

// MARK: Generated accessors for toComment
extension Post {

    @objc(addToCommentObject:)
    @NSManaged public func addToToComment(_ value: Comment)

    @objc(removeToCommentObject:)
    @NSManaged public func removeFromToComment(_ value: Comment)

    @objc(addToComment:)
    @NSManaged public func addToToComment(_ values: NSSet)

    @objc(removeToComment:)
    @NSManaged public func removeFromToComment(_ values: NSSet)

}

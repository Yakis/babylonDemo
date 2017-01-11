//
//  User+CoreDataProperties.swift
//  babylonDemo
//
//  Created by yakis on 11/01/2017.
//  Copyright © 2017 com.yakis. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User");
    }

    @NSManaged public var email: String?
    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var username: String?
    @NSManaged public var toPost: NSSet?

}

// MARK: Generated accessors for toPost
extension User {

    @objc(addToPostObject:)
    @NSManaged public func addToToPost(_ value: Post)

    @objc(removeToPostObject:)
    @NSManaged public func removeFromToPost(_ value: Post)

    @objc(addToPost:)
    @NSManaged public func addToToPost(_ values: NSSet)

    @objc(removeToPost:)
    @NSManaged public func removeFromToPost(_ values: NSSet)

}

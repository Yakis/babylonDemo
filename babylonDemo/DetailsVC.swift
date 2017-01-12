//
//  DetailsVC.swift
//  babylonDemo
//
//  Created by yakis on 12/01/2017.
//  Copyright © 2017 com.yakis. All rights reserved.
//

import UIKit
import CoreData

class DetailsVC: UIViewController {

    
    
    @IBOutlet weak var detailsTableView: UITableView!
    var post: Post?
    var user: User?
    var comments: Int?
    
    var userController: NSFetchedResultsController<User>!
    var commentController: NSFetchedResultsController<Comment>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers(url: Endpoints.users)
        
        
        
        detailsTableView.rowHeight = UITableViewAutomaticDimension
        detailsTableView.estimatedRowHeight = 200
        setupTableView()
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    
    func getUsers (url: String) {
        guard let userId = post?.userId else {return}
        let url = "\(url)/\(userId)"
        RestApiManager.shared.getUser(url: url, completion: { [unowned self] json in
            CoreDataInteractor.eraseDatabase(entityName: EntityNames.User, tableView: self.detailsTableView)
                self.saveUsers(user: json)
            self.fetchUser(id: userId)
           // self.getComments(url: Endpoints.comments)
        })
    }
    
    
    func getComments (url: String) {
        RestApiManager.shared.getData(url: url, completion: { [unowned self] array in
            CoreDataInteractor.eraseDatabase(entityName: EntityNames.Comment, tableView: self.detailsTableView)
            for comment in array {
                self.saveComments(comment: comment)
            }
        })
    }
    
    
    
    func saveUsers (user: JSON) {
        guard let id = user[UserKeys.id] as? Int64 else {return}
        guard let name = user[UserKeys.name] as? String else {return}
        guard let email = user[UserKeys.email] as? String else {return}
        guard let userName = user[UserKeys.username] as? String else {return}
        let userToSave = User(context: Shortcuts.context)
        userToSave.id = id
        userToSave.name = name
        print(userToSave.name!)
        userToSave.email = email
        userToSave.username = userName
        Shortcuts.appDelegate.saveContext()
    }
    
    
    func saveComments (comment: JSON) {
        guard let body = comment[CommentKeys.body] as? String else {return}
        guard let email = comment[CommentKeys.email] as? String else {return}
        guard let id = comment[CommentKeys.id] as? Int64 else {return}
        guard let name = comment[CommentKeys.name] as? String else {return}
        guard let postId = comment[CommentKeys.postId] as? Int64 else {return}
        let commentToSave = Comment(context: Shortcuts.context)
        commentToSave.body = body
        commentToSave.email = email
        commentToSave.id = id
        commentToSave.name = name
        commentToSave.postId = postId
        Shortcuts.appDelegate.saveContext()
        fetchComments(id: (post?.id)!)
    }
    
    
    func fetchUser (id: Int64) {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
       // fetchRequest.predicate = NSPredicate(format: "id = \(id)")
        do {
            let result = try Shortcuts.context.fetch(fetchRequest)
            guard let user = result.first else {return}
            self.user = user
            self.detailsTableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func fetchComments (id: Int64) {
        let fetchRequest: NSFetchRequest<Comment> = Comment.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "postId = \(id)")
        do {
            let result = try Shortcuts.context.fetch(fetchRequest)
            self.comments = result.count
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
    func setupTableView () {
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
        registerTitleCell(tableView: detailsTableView)
        registerBodyCell(tableView: detailsTableView)
    }
    
    
    
}

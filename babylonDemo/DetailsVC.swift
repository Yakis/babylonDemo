//
//  DetailsVC.swift
//  babylonDemo
//
//  Created by yakis on 12/01/2017.
//  Copyright © 2017 com.yakis. All rights reserved.
//

import UIKit
import RealmSwift

class DetailsVC: UIViewController {

    
    
    @IBOutlet weak var detailsTableView: UITableView!
    var post: Post?
    var user: User?
    var comments: Int = 0
    let realm = RealmManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsersFromServer(url: Endpoints.users)
        getCommentsFromServer(url: Endpoints.comments)
        detailsTableView.rowHeight = UITableViewAutomaticDimension
        detailsTableView.estimatedRowHeight = 200
        setupTableView()
        getUser()
        getComments()
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    
    func getUsersFromServer (url: String) {
        //        guard let userId = post?.userId else {return}
        //        let url = "\(url)/\(userId)"
        RestApiManager.shared.getData(url: url, completion: { [unowned self] array in
            var tempUsers = [User]()
            for json in array {
                guard let id = json["id"] as? Int else {return}
                guard let name = json["name"] as? String else {return}
                guard let username = json["username"] as? String else {return}
                guard let email = json["email"] as? String else {return}
                let user = User(id: id, name: name, username: username, email: email)
                tempUsers.append(user)
            }
            DispatchQueue.main.async {
                self.realm.saveObjects(objs: tempUsers)
                self.getUser()
                self.detailsTableView.reloadData()
            }
        })
    }
    
    
    func getCommentsFromServer (url: String) {
        RestApiManager.shared.getData(url: url, completion: { [unowned self] array in
            var tempComments = [Comment]()
            for object in array {
                guard let id = object["postId"] as? Int else {return}
                guard let postId = object["postId"] as? Int else {return}
                guard let name = object["name"] as? String else {return}
                guard let body = object["body"] as? String else {return}
                guard let email = object["email"] as? String else {return}
                let comment = Comment(id: id, postId: postId, name: name, body: body, email: email)
                tempComments.append(comment)
            }
            DispatchQueue.main.async {
                self.realm.saveObjects(objs: tempComments)
                self.getComments()
                self.detailsTableView.reloadData()
            }
        })
    }
    
    
    func getUser() {
        let realm = try! Realm()
        guard let userId = post?.userId else {return}
        user = realm.object(ofType: User.self, forPrimaryKey: userId)
    }
    
    
    func getComments () {
        let realm = try! Realm()
        guard let postId = post?.id else {return}
        let comments = realm.objects(Comment.self).filter("postId = \(postId)")
        self.comments = comments.count
    }
    
    
    func setupTableView () {
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
        registerTitleCell(tableView: detailsTableView)
        registerBodyCell(tableView: detailsTableView)
    }
    
    
    
}

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
        setupTableView()
        getUser()
        getComments()
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    
    func getUsersFromServer (url: String) {
        RestApiManager.shared.getData(url: url, completion: { [unowned self] array in
            var tempUsers = [User]()
            for json in array {
                let user = User(json: json)
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
            for json in array {
                let comment = Comment(json: json)
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
        let comments = realm.objects(Comment.self).filter("\(CommentKeys.postId) = \(postId)")
        self.comments = comments.count
    }
    
    
    func setupTableView () {
        detailsTableView.rowHeight = UITableViewAutomaticDimension
        detailsTableView.estimatedRowHeight = 200
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
        registerTitleCell(tableView: detailsTableView)
        registerBodyCell(tableView: detailsTableView)
    }
    
    
    
}

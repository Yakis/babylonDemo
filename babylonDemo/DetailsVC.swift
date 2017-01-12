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
        getUsers(url: Endpoints.users)
        getComments(url: Endpoints.comments)
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
            guard let id = json["id"] as? Int else {return}
            guard let name = json["name"] as? String else {return}
            guard let username = json["username"] as? String else {return}
            guard let email = json["email"] as? String else {return}
            self.user = User(id: id, name: name, username: username, email: email)
            DispatchQueue.main.async {
                self.detailsTableView.reloadData()
            }
        })
    }
    
    
    func getComments (url: String) {
        guard let postId = post?.id else {return}
        RestApiManager.shared.getData(url: url, completion: { [unowned self] array in
            for object in array {
                guard let id = object["postId"] as? Int else {return}
                if id == postId {
                    self.comments += 1
                }
            }
            DispatchQueue.main.async {
                self.detailsTableView.reloadData()
            }
        })
    }
    
    
    
    func setupTableView () {
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
        registerTitleCell(tableView: detailsTableView)
        registerBodyCell(tableView: detailsTableView)
    }
    
    
    
}

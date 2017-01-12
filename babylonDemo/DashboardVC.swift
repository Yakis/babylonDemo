//
//  DashboardVC.swift
//  babylonDemo
//
//  Created by yakis on 11/01/2017.
//  Copyright © 2017 com.yakis. All rights reserved.
//

import UIKit
import RealmSwift

class DashboardVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    let realm = RealmManager()
    var noPostsLabel = UILabel()
    var posts: [Post] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.noPostsLabel.removeFromSuperview()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getPostsFromServer(url: Endpoints.postsList)
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getPostsFromDatabase()
        
    }
    
    
    func setupTableView () {
        tableView.delegate = self
        tableView.dataSource = self
        registerPostCell(tableView: tableView)
        tableView.tableFooterView = UIView()
    }
    
    
    
    func getPostsFromServer(url: String) {
        RestApiManager.shared.getData(url: url, completion: { [unowned self] array in
            DispatchQueue.main.async {
                var tempPosts = [Post]()
                for object in array {
                    let post = Post(json: object)
                    tempPosts.append(post)
                }
                self.realm.saveObjects(objs: tempPosts)
                self.getPostsFromDatabase()
            }
        })
    }
    
    
    func getPostsFromDatabase() {
        posts.removeAll()
        if let objects = realm.getObjects(type: Post.self) {
            for element in objects {
                if let post = element as? Post {
                    posts.append(post)
                }
            }
            showMessageIfNoPosts(array: posts)
        }
    }
    
    
    func showMessageIfNoPosts (array: [Object]) {
        DispatchQueue.main.async {
            if array.isEmpty {
                self.noPostsLabel = UILabel(frame: self.tableView.frame)
                self.noPostsLabel.text = NoPosts.message
                self.noPostsLabel.font = NoPosts.font
                self.noPostsLabel.textAlignment = .center
                self.tableView.addSubview(self.noPostsLabel)
            }
        }
    }
    

}

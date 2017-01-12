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
    var posts: [Post] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
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
    }
    
    
    
    func getPostsFromServer(url: String) {
        RestApiManager.shared.getData(url: url, completion: { [unowned self] array in
            DispatchQueue.main.async {
                //self.realm.deleteDatabase()
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
        }
    }
    
    

}

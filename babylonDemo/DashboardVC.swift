//
//  DashboardVC.swift
//  babylonDemo
//
//  Created by yakis on 11/01/2017.
//  Copyright © 2017 com.yakis. All rights reserved.
//

import UIKit
import CoreData

class DashboardVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var controller: NSFetchedResultsController<Post>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        attemptFetch()
        getPosts(url: Endpoints.postsList)
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    func setupTableView () {
        tableView.delegate = self
        tableView.dataSource = self
        registerPostCell(tableView: tableView)
    }
    
    
    
    func getPosts(url: String) {
        RestApiManager.shared.getData(url: url, completion: { [unowned self] array in
            DispatchQueue.main.async {
                CoreDataInteractor.eraseDatabase(entityName: EntityNames.Post, tableView: self.tableView)
                for post in array {
                    self.savePosts(post: post)
                }
            }
        })
    }
    
    
    
    func savePosts (post: JSON) {
        guard let userId = post[PostKeys.userId] as? Int64 else {return}
        guard let id = post[PostKeys.id] as? Int64 else {return}
        guard let title = post[PostKeys.title] as? String else {return}
        guard let body = post[PostKeys.body] as? String else {return}
        let postToSave = Post(context: Shortcuts.context)
        postToSave.title = title
        postToSave.body = body
        postToSave.id = id
        postToSave.userId = userId
        Shortcuts.appDelegate.saveContext()
    }
    
    

}

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
        // addDummyData()
        attemptFetch()
    }

    
    func setupTableView () {
        tableView.delegate = self
        tableView.dataSource = self
        registerPostCell(tableView: tableView)
    }
    
    func addDummyData () {
        let post = Post(context: Shortcuts.context)
        post.title = "This is a test, just to see if CoreData is working, and it's working like a charm"
        post.id = 1
        post .userId = 44330
        post.body = "xffffffdf mpamfop afpa nfpanifnipi fnoafn aionfona idubiub ga"
        
        let post1 = Post(context: Shortcuts.context)
        post1.title = "This is a test, just to see if CoreData is working"
        post1.id = 1
        post1.userId = 44330
        post1.body = "xffffffdf mpamfop afpa nfpanifnipi fnoafn aionfona idubiub ga"

        let post2 = Post(context: Shortcuts.context)
        post2.title = "This is a test, just to see if CoreData is working"
        post2.id = 1
        post2.userId = 44330
        post2.body = "xffffffdf mpamfop afpa nfpanifnipi fnoafn aionfona idubiub ga"
        Shortcuts.appDelegate.saveContext()
    }

   

}

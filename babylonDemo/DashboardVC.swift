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
    var fetchResultsController: NSFetchedResultsController<Post>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    
    func setupTableView () {
        tableView.delegate = self
        tableView.dataSource = self
        registerPostCell(tableView: tableView)
    }
    
    

   

}

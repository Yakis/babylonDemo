//
//  DetailsVC.swift
//  babylonDemo
//
//  Created by yakis on 12/01/2017.
//  Copyright © 2017 com.yakis. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {

    
    
    @IBOutlet weak var detailsTableView: UITableView!
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let title = self.post?.title {
            print(title)
        }
    }
    
    
    func setupTableView () {
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
        registerTitleCell(tableView: detailsTableView)
        registerBodyCell(tableView: detailsTableView)
    }
    
    
    
}

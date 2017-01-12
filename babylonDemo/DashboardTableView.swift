//
//  DashboardTableView.swift
//  babylonDemo
//
//  Created by yakis on 11/01/2017.
//  Copyright © 2017 com.yakis. All rights reserved.
//

import Foundation
import UIKit


extension DashboardVC: UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK: - TableView delegate methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postCell = tableView.dequeueReusableCell(withIdentifier: DashboardNibs.PostCell, for: indexPath) as! PostCell
        let post = posts[indexPath.row]
        postCell.setupCell(post: post)
        return postCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        let detailsVC = DetailsVC(nibName: DetailsNibs.detailsVC, bundle: nil)
        self.navigationController?.pushViewController(detailsVC, animated: true)
        detailsVC.post = post
    }
    
    
    
    //MARK: - Register cells
    func registerPostCell (tableView: UITableView) {
        let nib = UINib(nibName: DashboardNibs.PostCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DashboardNibs.PostCell)
    }
    
    
 
    
    
}

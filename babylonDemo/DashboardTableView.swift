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
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections {
            return sections.count
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postCell = tableView.dequeueReusableCell(withIdentifier: DashboardNibs.PostCell, for: indexPath) as! PostCell
        configureCell(cell: postCell, indexPath: indexPath)
        return postCell
    }
    
    
    func configureCell (cell: PostCell, indexPath: IndexPath) {
        let post = controller.object(at: indexPath)
        cell.setupCell(post: post)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
    
    
    
    
    //MARK: - Register cells
    func registerPostCell (tableView: UITableView) {
        let nib = UINib(nibName: DashboardNibs.PostCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DashboardNibs.PostCell)
    }
    
    
    
}

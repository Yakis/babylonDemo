//
//  DetailsTableViewExtension.swift
//  babylonDemo
//
//  Created by yakis on 12/01/2017.
//  Copyright © 2017 com.yakis. All rights reserved.
//

import Foundation
import UIKit


extension DetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK: - TableView delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if user != nil {
            return 2
        } else {
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let titleCell = tableView.dequeueReusableCell(withIdentifier: DetailsNibs.titleCell, for: indexPath) as! TitleCell
            let title = post?.title ?? leaveEmpty
            let name = user?.name ?? leaveEmpty
            let commentsCount = comments
            tableView.separatorColor = Colors.deepPurple
            titleCell.setupCell(title: title, userName: name, commentsCount: commentsCount)
            return titleCell
        case 1:
            let bodyCell = tableView.dequeueReusableCell(withIdentifier: DetailsNibs.bodyCell, for: indexPath) as! BodyCell
            let text = post?.body ?? leaveEmpty
            bodyCell.setupCell(text: text)
            return bodyCell
        default:
            return UITableViewCell()
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableViewAutomaticDimension
    }
    
    
    //MARK: - Register cells
    func registerTitleCell (tableView: UITableView) {
        let nib = UINib(nibName: DetailsNibs.titleCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DetailsNibs.titleCell)
    }
    
    func registerBodyCell (tableView: UITableView) {
        let nib = UINib(nibName: DetailsNibs.bodyCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DetailsNibs.bodyCell)
    }
    
}

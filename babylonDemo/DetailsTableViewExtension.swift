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
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let titleCell = tableView.dequeueReusableCell(withIdentifier: DetailsNibs.titleCell, for: indexPath) as! TitleCell
            return titleCell
        case 1:
            let bodyCell = tableView.dequeueReusableCell(withIdentifier: DetailsNibs.bodyCell, for: indexPath) as! BodyCell
            return bodyCell
        default:
            return UITableViewCell()
        }
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

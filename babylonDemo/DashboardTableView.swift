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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postCell = tableView.dequeueReusableCell(withIdentifier: DashboardNibs.PostCell, for: indexPath)
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
    
    
    
    
    
    
    //MARK: - Register cells
    func registerPostCell (tableView: UITableView) {
        let nib = UINib(nibName: DashboardNibs.PostCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DashboardNibs.PostCell)
    }
    
    
    
}

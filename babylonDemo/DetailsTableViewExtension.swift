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
            let title = post?.title ?? ""
            let name = user?.name ?? ""
            let commentsCount = comments
            titleCell.setupCell(title: title, userName: name, commentsCount: commentsCount)
            return titleCell
        case 1:
            let bodyCell = tableView.dequeueReusableCell(withIdentifier: DetailsNibs.bodyCell, for: indexPath) as! BodyCell
            let text = "We like code that is simple, but simple is different than easy.\nKeep in mind the SOLID principles when doing the project.\nWe did leave out of the requirements if you should try to download everything (posts + each post detail). This is up to you to decide and justify why you did so.\nTesting is very important for us. Even if you don't write a single test (e.g. because of time constraints), your app should be easy to test (we love Dependency injection).\nError scenarios should be taken into consideration as well and how easy is to add them, even if you don't explicitly show them (e.g. using an UIAlertController).\nAlthough UI and UX are important, in this demo, we are more concerned on how you architect your application and your thought process. It should take into consideration features that might be added in the future.\nYou can use any 3rd party library you wish (Alamofire, ReactiveCocoa, PromiseKit, Realm, etc). In case you do, be prepared to justify why you used it. You can use CocoaPods, Carthage or Git Submodules for this (please don't drag and drop stuff around)."
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

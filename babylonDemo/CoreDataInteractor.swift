//
//  CoreDataInteractor.swift
//  babylonDemo
//
//  Created by yakis on 12/01/2017.
//  Copyright © 2017 com.yakis. All rights reserved.
//

import Foundation
import CoreData
import UIKit


struct CoreDataInteractor {
    
    static func eraseDatabase (entityName: String, tableView: UITableView) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try Shortcuts.context.execute(batchDeleteRequest)
            Shortcuts.context.reset()
             tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
}

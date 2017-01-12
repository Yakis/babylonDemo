//
//  DasboardCoreDataExtension.swift
//  babylonDemo
//
//  Created by yakis on 11/01/2017.
//  Copyright © 2017 com.yakis. All rights reserved.
//

import Foundation
import CoreData
import UIKit


extension DashboardVC: NSFetchedResultsControllerDelegate {
    
    func attemptFetch () {
        let fetchRequest: NSFetchRequest<Post> = Post.fetchRequest()
        let idSort = NSSortDescriptor(key: PostKeys.id, ascending: true)
        fetchRequest.sortDescriptors = [idSort]
        controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: Shortcuts.context, sectionNameKeyPath: nil, cacheName: nil)
        controller.delegate = self
        do {
            try self.controller.performFetch()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
    //MARK: - NSFetchedResultsController Delegate methods
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .none)
            }
            break
        case .delete:
            if let indexPath = indexPath {
            tableView.deleteRows(at: [indexPath], with: .none)
            }
            break
        case .update:
            if let indexPath = indexPath {
                let postCell = tableView.cellForRow(at: indexPath) as! PostCell
                configureCell(cell: postCell, indexPath: indexPath)
            }
            break
        default:
            break
        }
    }
    
    
    
}

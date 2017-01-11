//
//  DasboardCoreDataExtension.swift
//  babylonDemo
//
//  Created by yakis on 11/01/2017.
//  Copyright © 2017 com.yakis. All rights reserved.
//

import Foundation
import CoreData



extension DashboardVC: NSFetchedResultsControllerDelegate {
    
    func attemptFetch () {
        let fetchRequest: NSFetchRequest<Post> = Post.fetchRequest()
    }
    
}

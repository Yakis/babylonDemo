//
//  AppController.swift
//  babylonDemo
//
//  Created by yakis on 11/01/2017.
//  Copyright © 2017 com.yakis. All rights reserved.
//

import Foundation
import UIKit

class AppController: NSObject {
    
    class func launchDashboardIn(window: UIWindow) {
        window.rootViewController = self.createAndReturnRoot()
        window.makeKeyAndVisible()
    }
    
    class func createAndReturnRoot() -> UIViewController {
        let dashboardViewController = DashboardVC(nibName: DashboardNibs.dashboardVC, bundle: nil)
        let navigationController = UINavigationController(rootViewController: dashboardViewController)
        return navigationController
    }
    
}

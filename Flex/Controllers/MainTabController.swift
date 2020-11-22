//
//  MainTabController.swift
//  Flex
//
//  Created by Oscar Garcia Vazquez on 11/15/20.
//

import UIKit

class MainTabController : UITabBarController {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
    // MARK: - Helpers
    
    func configureViewControllers() {
        let weight = WeightTrackerController()
        let nav1 = configureControllerTemplate(title: "Weight", rootViewController: weight)
        
        viewControllers = [nav1]
    }
    
    func configureControllerTemplate(title : String, rootViewController : UIViewController) -> UIViewController {
            let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.title = title
        nav.navigationBar.barTintColor = .white
        
        return nav
    }
}

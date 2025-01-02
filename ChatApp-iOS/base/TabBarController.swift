//
//  TabBarController.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 30.12.2024.
//

import UIKit


class TabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .systemOrange
    }
    
    
    func findController<T: UIViewController>() -> T? {
        let controller = viewControllers?.first {
            $0 is T
        }
        
        return controller as? T
    }
}

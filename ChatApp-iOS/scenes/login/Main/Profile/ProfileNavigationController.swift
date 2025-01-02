//
//  ProfileNavigationController.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 31.12.2024.
//


class ProfileNavigationController: NavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootController = ProfileViewController()
        viewControllers = [rootController]
    }
}

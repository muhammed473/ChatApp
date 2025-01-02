//
//  MainTabBarController.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 30.12.2024.
//


class MainTabBarController: TabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let conversationsNavigationController = ConversationsNavigationController()
        conversationsNavigationController.tabBarItem = .init(title: "Chats", image: .iconChat, selectedImage: nil)
        
        let profileNavigationController = ProfileNavigationController()
        profileNavigationController.tabBarItem = .init(title: "Profile", image: .iconProfile, selectedImage: nil)
        
        viewControllers = [conversationsNavigationController, profileNavigationController]
    }
    
    
    var conversationsNavigationController: ConversationsNavigationController? {
        findController()
    }
    
    
    var profileNavigationController: ProfileNavigationController? {
        findController()
    }
}

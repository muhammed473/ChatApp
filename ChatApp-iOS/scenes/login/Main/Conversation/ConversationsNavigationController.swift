//
//  ChatsNavigationController.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 30.12.2024.
//


class ConversationsNavigationController: NavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootController = ConversationsController()
        viewControllers = [rootController]
    }
}

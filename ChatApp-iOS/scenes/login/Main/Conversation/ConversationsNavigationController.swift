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
    
    
    func conversationToNewConversation() {
        let controller = NewConversationsController()
        pushViewController(controller, animated: true)
    }
    
    func newConversationToChatController(selectedUser: SearchResult) {
        let controller = ChatViewController()
        controller.modalPresentationStyle = .fullScreen
        controller.viewModel.selectedUser = selectedUser
        present(controller, animated: true)
    }
}

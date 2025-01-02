//
//  ChatController.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 30.12.2024.
//


class ConversationsController: Controller<ConversationViewModel, ConversationsNavigationController> {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        setNavButton(icon: .iconProfile, onClicked: onClickedSearchUser)
        
    }
    
    
    private func onClickedSearchUser() {
        print("Search User button is clicked.")
    }
    
}

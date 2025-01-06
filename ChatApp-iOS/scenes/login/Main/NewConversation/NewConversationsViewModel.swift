//
//  NewConversationsViewModel.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 2.01.2025.
//


class  NewConversationsViewModel: ViewModel {
    
    private var results = [SearchResult]()
    
    
    func getUsers(text: String?, completion: Callback<[SearchResult]>?) {
        showLoading()
        
        DatabaseService.instance.fetchUsers { users in
            guard let currentUserEmail = UserDefaultsService.instance.currentUser?.email else {
                return
            }
            
            guard let users = users else {
                self.show(message: "Users is not found.", type: .error)
                return
            }
            
            let results: [SearchResult] = users.filter({ user in
                guard let email = user.email, email != currentUserEmail else {
                    return false
                }
                
                guard let name = user.name?.lowercased() else {
                    return false
                }
                
                return name.hasPrefix((text?.lowercased())!)
                
            }).compactMap { user in
                guard let email = user.email, let name = user.name else {
                    return nil
                }
                
                return  SearchResult(name: name, email: email)
            }
            self.hideLoading()
            completion?(results)
        }
    }
}

//
//  DatabaseService.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 28.12.2024.
//

import FirebaseFirestore
import FirebaseCore



struct DatabaseService: Service {
    
    static let instance = DatabaseService()
    private let db = Firestore.firestore()
    
    
    private init() { }
    
    
    func saveUser(user: User, completion: Handler?) {
        guard let uid = user.uid else {
            return
        }
        
        db.collection("Users").document(uid).setData(user.dictionary) { error in
            if let error = error {
                show(message: error.localizedDescription, type: .error)
                return
            }
            
            UserDefaultsService.instance.save(user, key: .user)
            
            completion?()
        }
    }
    
    
    func fetchUsers(completion: Callback<[User]?>?) {
        guard (UserDefaultsService.instance.currentUser?.uid) != nil else {
            show(message: "Please log in.", type: .error)
            return
        }
        
        db.collection("Users").getDocuments { snapshot, error in
            if let error = error {
                show(message: error.localizedDescription, type: .error)
                return
            }
            
            let users = ParserService.instance.parseToUsers(snapshot: snapshot)
            completion?(users)
        }
        
        
    }
}

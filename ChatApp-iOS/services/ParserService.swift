//
//  ParserService.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 3.01.2025.
//

import FirebaseFirestore


struct ParserService {
    
    static let instance = ParserService()
    
    
    private init() {
        
    }
    
    
    func parseToUsers(snapshot: QuerySnapshot?) -> [User]? {
        guard let snapshot = snapshot else {
            return nil
        }
        
        var users: [User] = []
        
        for document in snapshot.documents {
            let user = parseToUser(document: document)
            users.append(user)
        }
        
        return users
    }
    
    
    func parseToUser(document: QueryDocumentSnapshot) -> User {
        User(
            uid: document.documentID,
            name: document.get("name") as? String,
            surname: document.get("surname") as? String,
            email: document.get("email") as? String,
            imageUrl: nil
        )
    }
    
    
    
    
}

//
//  AuthService.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 23.12.2024.
//

import FirebaseAuth


struct AuthService: Service {
    
    static let instance = AuthService()
    private let auth = Auth.auth()
    
 
    func signIn(email: String, password: String, completion: Callback<String>?) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let uid = result?.user.uid {
                completion?(uid)
                return
            }
            
            show(message: error?.localizedDescription, type: .error)
        }
    }
    
    
    func registerUser(email: String, password: String, completion: Callback<String>?) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let uid = result?.user.uid {
                completion?(uid)
                return
            }
            show(message: error?.localizedDescription, type: .error)
        }
    }
    
}

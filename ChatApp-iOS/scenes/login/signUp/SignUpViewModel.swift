//
//  SignUpViewModel.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 23.12.2024.
//

import UIKit

class SignUpViewModel: ViewModel {
    
    
    func signUp(image: UIImage?, firstName: String?, lastName: String?, email: String?, password: String?, completion:Handler?) {
        guard
            let password = password,!password.isEmpty, password.count >= 7,
            let firstName = firstName, !firstName.isEmpty,
            let lastName = lastName, !lastName.isEmpty,
            let email = email, !email.isEmpty
        else {
            return
        }
        
        guard var image = image else {
            return
        }
        
        showLoading()
        
        AuthService.instance.registerUser(email: email, password: password) { uid in
            // StorageService.instance.upload(image: &image) { imageUrl in
            let user = User(uid: uid, name: firstName, surname: lastName, email: email, imageUrl: nil)
            
            DatabaseService.instance.saveUser(user: user) {
                self.show(message: "User registered successfully.", type: .success)
                completion?()
            }
        }
    }
    
}


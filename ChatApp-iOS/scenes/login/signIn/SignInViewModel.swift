//
//  SignInViewModel.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 22.12.2024.
//

class SignInViewModel: ViewModel {
 
    func  signIn(email: String, password: String, completion: Callback<String>?) {
        guard !email.isEmpty, !password.isEmpty else {
            return
        }
        
        showLoading()
        
        AuthService.instance.signIn(email: email, password: password, completion: completion)
    }
}

//
//  SplashViewModel.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 22.12.2024.
//

class SplashViewModel: ViewModel {
        
    var currentUser: User? {
        UserDefaultsService.instance.currentUser
    }
}

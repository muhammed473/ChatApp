//
//  SplashController.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 22.12.2024.
//

import Foundation

class SplashController: Controller<SplashViewModel, LoginNavigationController> {
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.showLoading()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: directPassageSignIn)
    }
    
    
  /*  private func checkCurrentUser() {
        viewModel.hideLoading()
        
        if let currentUser = viewModel.currentUser {
            navController?.leaveFromLogin(userType: currentUser.type)
            return
        }
        
        navController?.splashToSignIn()
    } */
    
    private func directPassageSignIn() {
        viewModel.hideLoading()
        navController?.splashToSignIn()
    }
}

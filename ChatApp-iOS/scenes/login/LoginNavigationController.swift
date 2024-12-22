//
//  LoginNavigationController.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 22.12.2024.
//

class LoginNavigationController: NavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isNavigationBarHidden = true
        
        let splashController = SplashController()
        viewControllers = [splashController]
    }
    
    
    func splashToSignIn() {
        let signInController = SignInController()
        pushViewController(signInController, animated: true)
        
        viewControllers.removeAll{
            $0 is SplashController
        }
    }
    
    
   /* func signInToSignUp() {
        let signUpController = SignUpController()
        pushViewController(signUpController, animated: true)
    }
    
    
    func signUpToSignIn() {
        popViewController(animated: true)
    } */
    
}

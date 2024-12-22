//
//  SignInController.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 22.12.2024.
//

import UIKit

class SignInController: Controller<SignInViewModel, LoginNavigationController> {
    
    private let logoImageView = ImageView()
    private let emailTextField = TextFieldLayout()
    private let passwordTextField = TextFieldLayout()
    private let signInButton = ButtonPrimary()
    private let signUpButton = ButtonSecondary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Sign In"
        
        view.backgroundColor = .systemBackground
        
        addSubviews(logoImageView, emailTextField, passwordTextField, signInButton, signUpButton)
        
        activateConstraints(
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
           // logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            emailTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 16),
            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 6),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            signInButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            
            signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            signUpButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            signUpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        )
        
    }
    
    
    override func customizeViews() {
        emailTextField.placeholder = "Email"
        
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        
        signInButton.setTitle("Sign In", for: .normal)
        /// MARK : Action yazılacak...
    
        signUpButton.setTitle("SignUp", for: .normal)
        /// MARK : Action yazılacak...
        
    }
    
}

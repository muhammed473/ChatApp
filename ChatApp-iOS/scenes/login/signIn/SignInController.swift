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
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          //  logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            emailTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 16),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 16),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        )
        
    }
    
    
    override func customizeViews() {
        logoImageView.backgroundColor = .blue
        logoImageView.set(cornerRadius: 60)
        
        emailTextField.placeholder = "Email"
        
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.action = signInButtonClicked
    
        signUpButton.setTitle("SignUp", for: .normal)
        signUpButton.action = signUpButtonClicked
    }
    
    
    private func signInButtonClicked() {
        guard
            let email = emailTextField.text,
            let password = passwordTextField.text
        else {
            return
        }
        
        viewModel.signIn(email: email, password: password) { userUid in
            self.viewModel.show(message: "New screen go to past. \(userUid)", type: .success)
        }
    }
    
    
    private func signUpButtonClicked() {
        navController?.signInToSignUp()
    }
    
}

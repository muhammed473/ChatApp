//
//  SignUpController.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 23.12.2024.
//

import UIKit


class SignUpController: ControllerHasImagePicker<SignUpViewModel, LoginNavigationController> {
    
    private let imageView = ImageView()
    private let firstNameTextField = TextFieldLayout()
    private let lastNameTextField = TextFieldLayout()
    private let emailTextField = TextFieldLayout()
    private let passwordTextField = TextFieldLayout()
    private let signUpButton = ButtonPrimary()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        addSubviews(imageView, firstNameTextField, lastNameTextField, emailTextField, passwordTextField, signUpButton)
        
        activateConstraints(
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            firstNameTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 14),
            firstNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 8),
            lastNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 8),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 26),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        )
    }
    
    
    override func customizeViews() {
        imageView.set(cornerRadius: 60)
        imageView.image = .iconAdd
        imageView.isUserInteractionEnabled = true
        imageView.clipsToBounds = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageClicked))
        imageView.addGestureRecognizer(tapGesture)
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.action = signUpButtonClicked
        
        firstNameTextField.placeholder = "First Name"
        lastNameTextField.placeholder = "Last Name"
        emailTextField.placeholder = "Email"
        
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
    }
    
    
    func signUpButtonClicked() {
        let firstName = firstNameTextField.text
        let lastName = lastNameTextField.text
        let email = emailTextField.text
        let password = passwordTextField.text
        let image = imageView.image
        
        viewModel.signUp(image: image, firstName: firstName, lastName: lastName, email: email, password: password) {
            self.viewModel.show(message: "TABBAR YAPISINA ŞİMDİ GEÇEBİLİRSİN ", type: .success)
        }
    }
    
    
    @objc  func imageClicked() {
        super.openImagePicker()
    }
    
    
    override func onImageSelected(image: UIImage) {
        imageView.image = image
    }
    
}

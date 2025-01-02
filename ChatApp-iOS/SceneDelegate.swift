//
//  SceneDelegate.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 22.12.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else {
            return
        }
        
        let window = UIWindow(windowScene: scene)
        window.rootViewController = LoginNavigationController()
        window.makeKeyAndVisible()
        
        LoadingView.instance.setup(window: window)
        AlertView.instance.setup(window: window)
        
        self.window = window
    }


}


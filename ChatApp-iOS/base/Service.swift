//
//  Service.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 23.12.2024.
//

import Foundation


protocol Service {
    func show(message: String?, type: AlertType)
}


extension Service {
    
    
    func show(message: String?, type: AlertType) {
        let okAction = AlertModel(title: "Okay")
        AlertView.instance.show(type: type, message: message, actions: [okAction])
    }
}

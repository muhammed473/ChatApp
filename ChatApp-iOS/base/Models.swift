//
//  Models.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 22.12.2024.
//

import UIKit



struct AlertModel {
    let title: String?
    var action: Handler?
}



struct User: Codable {
    let uid: String?
    let name: String?
    let surname: String?
    let email: String?
    let imageUrl: String?
}


struct Conversation: Codable {
    let id: String?
    let name: String?
    let otherEmail: String?
    let lastMessage: LastMessage?
}



struct LastMessage: Codable {
    let date: String?
    let text: String?
    let isRead: Bool?
}

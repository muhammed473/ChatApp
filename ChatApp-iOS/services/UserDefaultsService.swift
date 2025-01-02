//
//  UserDefaultsService.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 28.12.2024.
//

import Foundation

struct UserDefaultsService {
    
    
    static let instance = UserDefaultsService()
    private let defaults = UserDefaults.standard
    private let jsonDecoder = JSONDecoder()
    private let jsonEncoder = JSONEncoder()
    
    private init() { }
    
    
    func save<T: Codable>(_ object: T, key: UserDefaultsKey) {
        guard let encoded = try? jsonEncoder.encode(object) else {
            return
        }
        
        defaults.setValue(encoded, forKey: key.rawValue)
    }
    
    private func fetch<T: Codable>(key: UserDefaultsKey) -> T? {
        guard let data = defaults.object(forKey: key.rawValue) as? Data else {
            return nil
        }
        
        return try? jsonDecoder.decode(T.self, from: data)
    }
    
    
    var currentUser: User? {
        fetch(key: .user)
    }
    
}

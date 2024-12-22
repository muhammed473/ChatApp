//
//  Buttons.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 22.12.2024.
//

import UIKit


class ButtonPrimary: Button {
    
    
    override func configure() {
        widthAnchor.constraint(equalToConstant: Device.width * 0.8).isActive = true
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        layer.cornerRadius = 14
        backgroundColor = .systemOrange
        setTitleColor(.white, for: .normal)
    }
}


class ButtonSecondary: Button {
    
    
    override func configure() {
        widthAnchor.constraint(equalToConstant: Device.width * 0.8).isActive = true
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        layer.cornerRadius = 14
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemOrange.cgColor
        
        backgroundColor = .white
        setTitleColor(.systemOrange, for: .normal)
    }
}



class ButtonTitle: Button {
    
    
    override func configure() {
        titleLabel?.font = .setDynamicFont(size: 14)
        setTitleColor(.white.withAlphaComponent(0.5), for: .normal)
        contentEdgeInsets = .zero
    }
    
    
    func setTitle(normal: String, underline: String) {
        let normalAttributed = NSAttributedString(string: normal)
        
        let underlineAttributed = NSMutableAttributedString(string: underline)
        underlineAttributed.addAttribute(.foregroundColor, value: UIColor.white.withAlphaComponent(0.75), range: NSRange(location: 0, length: underlineAttributed.length))
        underlineAttributed.addAttribute(.font, value: UIFont.setDynamicFont(size: 14), range: NSRange(location: 0, length: underlineAttributed.length))
        underlineAttributed.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: underlineAttributed.length))
        
        let attributedString = NSMutableAttributedString()
        attributedString.append(normalAttributed)
        attributedString.append(underlineAttributed)
        
        setAttributedTitle(attributedString, for: .normal)
        
        contentEdgeInsets = .init(top: 1, left: 0, bottom: 1, right: 0)
    }
}
//
//  NewConversationTableView.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 4.01.2025.
//


class NewConversationTableView: TableView<SearchResult, NewConversationTableViewCell> {
    
    override func configure() {
        
    }
}

class NewConversationTableViewCell: TableViewCell<SearchResult> {
    
    private let userImageView = ImageView()
    private let nameLabel = Label()
    
    
    override func configure() {
        addSubviews(userImageView, nameLabel)
        
        activateConstraints(
           /* userImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 6),
            userImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 6), */
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            
            contentView.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 42)
        )
    }
    
    
    override func setItem(_ item: SearchResult) {
        nameLabel.text = item.name
    }
    
}
    

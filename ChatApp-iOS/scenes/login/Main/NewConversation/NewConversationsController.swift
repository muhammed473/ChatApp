//
//  NewConversationController.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 2.01.2025.
//

import UIKit


class NewConversationsController: Controller<NewConversationsViewModel, ConversationsNavigationController>, UISearchBarDelegate {
    
    private let mySearchBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Kullanıcıları ara..."
        return searchBar
    }()
    private let tableView = NewConversationTableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        mySearchBar.delegate = self
        mySearchBar.translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews(tableView, mySearchBar)
        
        mySearchBar.becomeFirstResponder()
        
        tableView.onItemSelected = navController?.newConversationToChatController
        
        activateConstraints(
            mySearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            mySearchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            mySearchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            
            tableView.topAnchor.constraint(equalTo: mySearchBar.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        )
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.replacingOccurrences(of: " ", with: "").isEmpty else {
            return
        }
        
        searchBar.resignFirstResponder()
        searchUsers(text: text)
    }
    
    
    func searchUsers(text: String) {
        viewModel.getUsers(text: text, completion: { searchResultsUsers in
          //  print("One of the users shown as a search result: \(searchResultsUsers.first?.name)")
            self.tableView.addItems(searchResultsUsers)
        })
    }
}

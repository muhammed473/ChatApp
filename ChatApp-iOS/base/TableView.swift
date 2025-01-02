//
//  TableView.swift
//  ChatApp-iOS
//
//  Created by muhammed dursun on 2.01.2025.
//

import UIKit


//MARK: TableView
class TableView<ITEM, C: TableViewCell<ITEM>>: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    fileprivate var items: [ITEM] = []
    private let cellId = UUID().uuidString
    
    ///Tıklanan item'ı handle etmek için kullanırız.
    var onItemSelected: Callback<ITEM>?
    
    
    required init() {
        super.init(frame: .zero, style: .plain)
        
        translatesAutoresizingMaskIntoConstraints = false
        delegate = self
        dataSource = self
        backgroundColor = .clear
        register(C.self, forCellReuseIdentifier: cellId)
        
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: cellId) as? C else { return .init() }
        
        let item = items[indexPath.row]
        cell.setItem(item)
        
        handle(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        onItemSelected?(item)
        
        deselectRow(at: indexPath, animated: true)
    }
    
    
   
    func setItems(_ items: [ITEM]) {
        self.items = items
        reloadData()
    }
    
    
   
    func addItems(_ newItems: [ITEM]) {
        items.append(contentsOf: newItems)
        reloadData()
    }
    
    
    func addToFirst(item: ITEM, withScroll: Bool) {
        items.insert(item, at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)

        beginUpdates()
        insertRows(at: [indexPath], with: .fade)
        endUpdates()
        
        if withScroll {
            scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    
    
    func addToLast(item: ITEM, withScroll: Bool) {
        items.append(item)
        
        let indexPath = IndexPath(row: items.count - 1, section: 0)

        beginUpdates()
        insertRows(at: [indexPath], with: .fade)
        endUpdates()
        
        if withScroll {
            scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    
  
    func clear() {
        items.removeAll()
        reloadData()
    }
    
    
    
    func configure() { }
    
    
    func handle(cell: C, indexPath: IndexPath) {}
}




//MARK: TableViewCell
class TableViewCell<ITEM>: UITableViewCell {
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configure() {}
    
    
    func addSubviews(_ subview: UIView...) {
        subview.forEach {
            contentView.addSubview($0)
        }
    }
    
    
    func setItem(_ item: ITEM) {}
    
    
    func activateConstraints(_ constraints: NSLayoutConstraint...) {
        NSLayoutConstraint.activate(constraints)
    }
    
    
    var selectionBackgroundColor: UIColor? {
        get {
            selectedBackgroundView?.backgroundColor
        }
        
        set {
            let selectionView = View()
            selectionView.backgroundColor = newValue
            selectedBackgroundView = selectionView
        }
    }
    
    
    var item: ITEM? {
        guard
            let tableView = superview as? TableView<ITEM, Self>,
            let indexPath = tableView.indexPath(for: self)
        else {
            return nil
        }
        
        return tableView.items[indexPath.row]
    }
}

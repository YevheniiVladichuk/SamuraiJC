//
//  ChatUI.swift
//  SamuraiJC
//
//  Created by Yevhenii Vladichuk on 20/03/2023.
//

import Foundation
import UIKit

class ChatUI: UIView {

    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = UIColor(named: K.Colors.background)
        table.register(MessageCell.self, forCellReuseIdentifier: MessageCell.id)
        table.separatorStyle = .none
        table.keyboardDismissMode = .onDrag
        return table
    }()
    
    let bottomView: UIView = {
        let bottomView = UIView()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = UIColor(named: K.Colors.redSamurai)
        return bottomView
    }()
    
    let messageField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.cornerRadius = 10
        field.font = field.font?.withSize(17)
        field.backgroundColor = UIColor(named: K.Colors.chatField)
        field.textAlignment = .left
        field.leftView = UIView(frame:  CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.textColor = UIColor(named: K.Colors.textColor)
        field.tintColor = UIColor(named: K.Colors.textColor)
        return field
    }()
    
    let sendButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 25, weight: .light, scale: .small)
        let image = UIImage(systemName: "paperplane.fill", withConfiguration: symbolConfiguration)
        btn.setImage(image, for: .normal)
        btn.tintColor = UIColor(named: K.Colors.chatField)
        return btn
    }()
    
    let swipeDown: UISwipeGestureRecognizer = {
        let swipeDown = UISwipeGestureRecognizer()
        swipeDown.direction = .down
        return swipeDown
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpViews()
    }
    
    func setUpViews() {
        
        backgroundColor = UIColor(named: K.Colors.redSamurai)
        
        addGestureRecognizer(swipeDown)
        addSubview(bottomView)
        addSubview(tableView)
        bottomView.addSubview(messageField)
        bottomView.addSubview(sendButton)
        
        
        NSLayoutConstraint.activate([
            
            keyboardLayoutGuide.topAnchor.constraint(
                equalToSystemSpacingBelow: bottomView.bottomAnchor, multiplier: 1.0),
            
            bottomView.heightAnchor.constraint(equalToConstant: 50),
            bottomView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            sendButton.heightAnchor.constraint(equalToConstant: 40),
            sendButton.widthAnchor.constraint(equalToConstant: 40),
            sendButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -20),
            sendButton.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 10),
            
            messageField.heightAnchor.constraint(equalToConstant: 40),
            messageField.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 10),
            messageField.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 25),
            messageField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -15),
            
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
        ])
    }
    
    func configChatNavBar(navBar: UINavigationBar, navItem: UINavigationItem, target: Any?, rightButtonAction: Selector) {
        navBar.customizeTitle()
        navItem.hidesBackButton = true
        let rightButton = UIBarButtonItem(title: "Вихід", style: .plain, target: target, action: rightButtonAction)
        navItem.rightBarButtonItem = rightButton
    }

}



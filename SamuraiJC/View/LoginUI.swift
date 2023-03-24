//
//  LoginUI.swift
//  SamuraiJC
//
//  Created by Yevhenii Vladichuk on 18/03/2023.
//

import Foundation
import UIKit


class LoginUI: WelcomeUI {
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor(named: K.Colors.background)
        return contentView
    }()
    
    let emailTextField: CustomUITextField = {
        let emailTextField = CustomUITextField()
        emailTextField.placeholder = "Email"
        return emailTextField
    }()
    
    let passwordTextField: CustomUITextField = {
        let passwordTextField = CustomUITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    
    let errorLabel: UILabel = {
        let errorLabel = UILabel()
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.font = UIFont(name: "AmericanTypewriter", size: 22)
        errorLabel.numberOfLines = 0
        errorLabel.alpha = 0
        errorLabel.textAlignment = .center
        return errorLabel
    }()
    
    override func setUpViews() {
        
        backgroundColor = UIColor(named: K.Colors.redSamurai)
        
        addSubview(contentView)
        contentView.addSubview(stack)
        
        stack.addArrangedSubview(emailTextField)
        stack.addArrangedSubview(passwordTextField)
        stack.addArrangedSubview(loginBtn)
        stack.addArrangedSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            errorLabel.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func configNavBar(navBar: UINavigationBar, navItem: UINavigationItem, target: Any?, action: Selector, mainTitle: String, backTitle: String) {
        navBar.customizeTitle()
        navItem.title = mainTitle
        navItem.leftBarButtonItem = UIBarButtonItem(title: backTitle, style: .plain, target: target, action: action)
        navItem.leftBarButtonItem?.tintColor = .white
    }
}

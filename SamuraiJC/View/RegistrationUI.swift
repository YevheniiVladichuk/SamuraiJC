//
//  RegistrationUI.swift
//  SamuraiJC
//
//  Created by Yevhenii Vladichuk on 19/03/2023.
//

import Foundation
import UIKit

class RegistrationUI: LoginUI {
    
    
    let registrationBtn: RedButton = {
        let btn = RedButton()
        btn.setTitle("Реєстрація", for: .normal)
        return btn
    }()
    
    override func setUpViews() {
        backgroundColor = UIColor(named: "RedSamurai")
        
        addSubview(contentView)
        contentView.addSubview(stack)
        
        stack.addArrangedSubview(emailTextField)
        stack.addArrangedSubview(passwordTextField)
        stack.addArrangedSubview(registrationBtn)
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
}

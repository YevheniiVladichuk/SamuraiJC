//
//  ChatUI.swift
//  SamuraiJC
//
//  Created by Yevhenii Vladichuk on 20/03/2023.
//

import Foundation
import UIKit

class ChatUI: RegistrationUI {
    
    override func setUpViews() {
        
        backgroundColor = UIColor(named: "RedSamurai")
        addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)

        ])
        
    }
}

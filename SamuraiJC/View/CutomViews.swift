//
//  MainScreen.swift
//  SamuraiJC
//
//  Created by Yevhenii Vladichuk on 17/03/2023.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    func setUp() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 25
        self.backgroundColor = .black
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: 22)
        
        self.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

class RedButton: CustomButton {
    
    override func setUp() {
        super.setUp()
        self.backgroundColor = UIColor(named: "RedSamurai")
    }
}

class CustomUITextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    func setUp() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 5
        self.font = self.font?.withSize(18)
        self.backgroundColor = UIColor.systemFill
        self.textAlignment = .left
        self.leftView = UIView(frame:  CGRect(x: 0, y: 0, width: 20, height: 0))
        self.leftViewMode = .always
        self.textColor = UIColor(named: "TextColor")
        self.tintColor = UIColor(named: "TextColor")
        self.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

extension UINavigationBar {
    func customizeFont() {
        self.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "AmericanTypewriter-SemiBold", size: 24)!,
                                    NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}


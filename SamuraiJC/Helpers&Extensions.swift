//
//  MainScreen.swift
//  SamuraiJC
//
//  Created by Yevhenii Vladichuk on 17/03/2023.
//

import Foundation
import UIKit

struct K {
    
    struct Colors {
        static let redSamurai = "RedSamurai"
        static let background = "Background"
        static let textColor = "TextColor"
        static let chatField = "ChatField"
    }
    
}

class MessageCell: UITableViewCell {
    
    static let id = "MessageCell"
    
    let hStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 20
        stack.alignment = .top
        return stack
    }()
    
    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: K.Colors.chatField)
        return view
    }()
    
    let message: UILabel = {
        let message = UILabel()
        message.translatesAutoresizingMaskIntoConstraints = false
        return message
    }()
    
    let rightImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "MeAvatar")
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
        configProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
        configProperties()
    }
    
    func configProperties() {
        self.selectionStyle = .none
    }
    
    func setUpView() {
        
        backgroundColor = UIColor(named: K.Colors.background)
        
        self.contentView.addSubview(hStack)
        hStack.addArrangedSubview(view)
        view.addSubview(message)
        hStack.addArrangedSubview(rightImage)
        
        
        NSLayoutConstraint.activate([
            
            hStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            hStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            hStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            hStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            message.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            message.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            message.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            message.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            rightImage.heightAnchor.constraint(equalToConstant: 40),
            rightImage.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}

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
        self.backgroundColor = UIColor(named: K.Colors.redSamurai)
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
        self.textColor = UIColor(named: K.Colors.textColor)
        self.tintColor = UIColor(named: K.Colors.textColor)
        self.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

// MARK: - Extensions

extension UINavigationBar {
    func customizeTitle() {
        self.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "AmericanTypewriter-SemiBold", size: 24)!,
                                    NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}

extension UIViewController {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}


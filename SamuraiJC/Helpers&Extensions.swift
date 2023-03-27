//
//  MainScreen.swift
//  SamuraiJC
//
//  Created by Yevhenii Vladichuk on 17/03/2023.
//

import Foundation
import UIKit

// MARK: - Constants
struct K {
    
    struct Colors {
        static let redSamurai = "RedSamurai"
        static let background = "Background"
        static let textColor = "TextColor"
        static let chatField = "ChatField"
        static let myMessage = "MyMessageBackground"
        static let someOne = "SomeOneElseMessage"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
// MARK: - Custom UITableViewCell
class MessageCell: UITableViewCell {
    
   static var id = "MessageCell"
    
    let hStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 20
        stack.alignment = .top
        return stack
    }()
    
    let messageBackground: UIView = {
        let messageBackground = UIView()
        messageBackground.translatesAutoresizingMaskIntoConstraints = false
        messageBackground.backgroundColor = UIColor(named: K.Colors.myMessage)
        messageBackground.layer.cornerRadius = 14
        return messageBackground
    }()
    
    let messageText: UILabel = {
        let messageText = UILabel()
        messageText.translatesAutoresizingMaskIntoConstraints = false
        messageText.numberOfLines = 0
        return messageText
    }()
    
    let rightAvatar: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "MeAvatar")
        return image
    }()
    
    let leftAvatar: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "YouAvatar")
        return image
    }()
    
    let leftSpacerView: UIView = {
        let spacerView = UIView()
        spacerView.backgroundColor = .blue
        return spacerView
    }()
    
    let rightrigSpacerView: UIView = {
        let spacerView = UIView()
        spacerView.backgroundColor = .yellow
        return spacerView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        configProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpViews()
        configProperties()
    }
    
    func configProperties() {
        self.selectionStyle = .none
    }
    
    func setUpViews() {
        
        backgroundColor = .clear
        
        self.contentView.addSubview(hStack)
        hStack.addArrangedSubview(leftAvatar)
        hStack.addArrangedSubview(leftSpacerView)
        hStack.addArrangedSubview(messageBackground)
        messageBackground.addSubview(messageText)
        hStack.addArrangedSubview(rightrigSpacerView)
        hStack.addArrangedSubview(rightAvatar)
        
        NSLayoutConstraint.activate([
            
            hStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            hStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            hStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            hStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            messageBackground.heightAnchor.constraint(equalTo: hStack.heightAnchor),
                        
            messageText.topAnchor.constraint(equalTo: messageBackground.topAnchor, constant: 10),
            messageText.leadingAnchor.constraint(equalTo: messageBackground.leadingAnchor, constant: 7),
            messageText.bottomAnchor.constraint(equalTo: messageBackground.bottomAnchor, constant: -10),
            messageText.trailingAnchor.constraint(equalTo: messageBackground.trailingAnchor, constant: -7),
            
            leftAvatar.heightAnchor.constraint(equalToConstant: 40),
            leftAvatar.widthAnchor.constraint(equalToConstant: 40),
            
            rightAvatar.heightAnchor.constraint(equalToConstant: 40),
            rightAvatar.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}

// MARK: - Custom Buttons
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

// MARK: - Custom TextField
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


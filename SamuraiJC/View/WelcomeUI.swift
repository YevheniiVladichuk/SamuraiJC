//
//  MainUI.swift
//  SamuraiJC
//
//  Created by Yevhenii Vladichuk on 17/03/2023.
//

import Foundation
import UIKit

class WelcomeUI: UIView {
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 10
        stack.distribution = .fill
        return stack
    }()
    
    let logo: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "SamuraiLogo")
        return logo
    }()
    
    let mottoLabel: UILabel = {
        let motto = UILabel()
        motto.numberOfLines = 0
        motto.text = ""
        motto.font = UIFont(name: "AmericanTypewriter-SemiBold", size: 18)
        return motto
    }()
    
    let loginBtn: RedButton = {
        let loginBtn = RedButton()
        loginBtn.setTitle("Вхід", for: .normal)
        return loginBtn
    }()
    
    let registerBtn: CustomButton = {
        let register = CustomButton()
        register.setTitle("Реєстрація", for: .normal)
        return register
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
        
        backgroundColor = UIColor(named: K.Colors.background)
        
        addSubview(stack)
        stack.addArrangedSubview(logo)
        stack.addArrangedSubview(mottoLabel)
        stack.addArrangedSubview(loginBtn)
        stack.addArrangedSubview(registerBtn)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            logo.widthAnchor.constraint(equalToConstant: 350),
            logo.heightAnchor.constraint(equalToConstant: 330),
            
            mottoLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        var count = 0
        let motto = "Сильні духом, непереможні в бою !"
        for letters in motto {
            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(count), repeats: false) { (timer) in
                self.mottoLabel.text?.append(letters)
            }
            count += 1
        }
    }
}


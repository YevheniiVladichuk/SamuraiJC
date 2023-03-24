//
//  ViewController.swift
//  SamuraiJC
//
//  Created by Yevhenii Vladichuk on 17/03/2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    let welcomeUI = WelcomeUI()
    
    override func loadView() {
        view = welcomeUI
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeUI.loginBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        welcomeUI.registerBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    
    @objc func buttonTapped(_ sender: UIButton) {
        if sender == welcomeUI.loginBtn {
            
            let loginVC = LoginViewController()
            navigationController?.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(loginVC, animated: true)
        }else {
            
            let registrationVC = RegistrationViewController()
            navigationController?.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(registrationVC, animated: true)
        }
    }
}

//
//  RegistrationViewController.swift
//  SamuraiJC
//
//  Created by Yevhenii Vladichuk on 18/03/2023.
//

import UIKit
import FirebaseAuth

class RegistrationViewController: UIViewController {
    
    let registrationUI = RegistrationUI()
    
    override func loadView() {
        super.loadView()
        view = registrationUI
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navController = self.navigationController
        let navBar = navController!.navigationBar
                
        registrationUI.configNavBar(navBar: navBar, navItem: navigationItem, target: self, action: #selector(goBack), mainTitle: "Реєстрація", backTitle: "Назад")
        
        registrationUI.registrationBtn.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
    }

    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func registrationButtonTapped(_ sender: UIButton) {
        
        if let email = registrationUI.emailTextField.text, let password = registrationUI.passwordTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    self.registrationUI.errorLabel.alpha = 1
                    self.registrationUI.errorLabel.text = "Перевір введенні данні"
                    print(error)
                    return
                }else {
                    let loginVC = LoginViewController()
                    self.navigationController?.modalPresentationStyle = .fullScreen
                    self.navigationController?.pushViewController(loginVC, animated: true)
                }
            }
        }
    }
}

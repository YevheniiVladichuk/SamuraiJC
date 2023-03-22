//
//  LoginViewController.swift
//  SamuraiJC
//
//  Created by Yevhenii Vladichuk on 18/03/2023.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    let loginUI = LoginUI()
    
    override func loadView() {
        super.loadView()
        view = loginUI
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navController = self.navigationController
        let navBar = navController!.navigationBar
        
        loginUI.configNavBar(navController: navController, navBar: navBar, navItem: navigationItem, target: self, action: #selector(goBack), title: "Логін", backTitle: "Назад")
        loginUI.loginBtn.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func loginTapped(_ sender: UIButton) {
        if let email = loginUI.emailTextField.text, let password = loginUI.passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    self.loginUI.errorLabel.alpha = 1
                    self.loginUI.errorLabel.text = error.localizedDescription
                }else {
                    let chatVC = ChatViewController()
                    self.navigationController?.modalPresentationStyle = .fullScreen
                    self.navigationController?.pushViewController(chatVC, animated: true)
                }
            }
        }
    }
}

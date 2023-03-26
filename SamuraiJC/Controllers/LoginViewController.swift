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
        loginUI.configNavBar(navBar: navBar, navItem: navigationItem, target: self, action: #selector(goBack), mainTitle: "Логін", backTitle: "Назад")
        loginUI.loginBtn.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func loginTapped(_ sender: UIButton) {
        let e = "1@2.com"
        let p = "123456"
        
//        if let email = loginUI.emailTextField.text, let password = loginUI.passwordTextField.text {

            Auth.auth().signIn(withEmail: e, password: p) { authResult, error in
                if let error = error {
                    print(error.localizedDescription)
                    self.loginUI.errorLabel.alpha = 1
                    self.loginUI.errorLabel.text = "Щось не так :(\nПеревірте введені дані !"
                }else {
                    let chatVC = ChatViewController()
                    self.navigationController?.modalPresentationStyle = .fullScreen
                    self.navigationController?.pushViewController(chatVC, animated: true)
                }
//            }
        }
    }
}

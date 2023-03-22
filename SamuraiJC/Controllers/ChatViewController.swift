//
//  ChatViewController.swift
//  SamuraiJC
//
//  Created by Yevhenii Vladichuk on 20/03/2023.
//

import UIKit

class ChatViewController: UIViewController {
    
    let chatUI = ChatUI()
    
    override func loadView() {
        view = chatUI
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navController = self.navigationController
        let navBar = navController!.navigationBar
        
        chatUI.configNavBar(navController: navController, navBar: navBar, navItem: navigationItem, target: self, action: #selector(exit), title: "Чат", backTitle: "Вихід")
    }
    
    @objc func exit() {
        let welcomeVC = WelcomeViewController()
        self.navigationController?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(welcomeVC, animated: true)
    }
}

//
//  ChatViewController.swift
//  SamuraiJC
//
//  Created by Yevhenii Vladichuk on 20/03/2023.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {
    
    let chatUI = ChatUI()
    
    
    var message: [Message] = [
        Message(sender: "Me", body: "Hello, how are you ?"),
        Message(sender: "You", body: "Fine, and you ?"),
        Message(sender: "Me", body: "Very good !!!"),
        Message(sender: "You", body: "Will we go to the GYM ?"),
    
    ]
    
    override func loadView() {
        view = chatUI
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatUI.tableView.dataSource = self
        chatUI.tableView.delegate = self
        
        let navController = self.navigationController
        let navBar = navController!.navigationBar
        
        chatUI.configChatNavBar(navBar: navBar, navItem: navigationItem, target: self, rightButtonAction: #selector(exitTapped))
    }
    
    @objc func exitTapped() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

// MARK: - Extensions

extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.id, for: indexPath)
        cell.textLabel?.text = message[indexPath.row].body
        return cell
    }
}

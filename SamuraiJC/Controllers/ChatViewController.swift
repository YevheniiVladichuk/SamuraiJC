//
//  ChatViewController.swift
//  SamuraiJC
//
//  Created by Yevhenii Vladichuk on 20/03/2023.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    let chatUI = ChatUI()
    let db = Firestore.firestore()
    
    var message: [Message] = []
    
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
        chatUI.sendButton.addTarget(self, action: #selector(sendTapped), for: .touchUpInside)
        
        loadMessages()
    }
    
    
    func loadMessages() {
        
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener() {(querySnapshot, error) in
            self.message = []
            
            if let e = error {
                print("There was an issue retriving data: \(e)")
            }else {
                
                if let snapshotDocuments = querySnapshot?.documents{
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.message.append(newMessage)
                            
                            DispatchQueue.main.async {
                                self.chatUI.tableView.reloadData()
                                let indexPath = IndexPath(row: self.message.count - 1, section: 0)
                                self.chatUI.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                                self.chatUI.messageField.text = nil
                            }
                            
                        }
                        
                    }
                }
            }
        }
    }
    
    @objc func exitTapped() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.isNavigationBarHidden = true
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    @objc func sendTapped(_ sender: UIButton) {
        
        if let messageBody = chatUI.messageField.text, let sender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField: sender,
                K.FStore.bodyField: messageBody,
                K.FStore.dateField: Date().timeIntervalSince1970
            ]) { error in
                if let error = error {
                    print ("There was an issue saving datato firestore with error: \(error)")
                }else {
                    print("succesfully")
                }
            }
            
        }
    }
}

// MARK: - Extensions

extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = message[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.id, for: indexPath) as! MessageCell
        cell.message.text = message.body
        
        if message.sender == Auth.auth().currentUser!.email {
            cell.leftImage.isHidden = true
        } else {
            cell.rightImage.isHidden = true
            cell.leftImage.isHidden = false
            cell.backgroundColor = UIColor(named: K.Colors.someOne)
        }
        
    
        return cell
    }
}



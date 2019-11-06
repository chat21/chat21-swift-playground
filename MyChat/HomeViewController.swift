//
//  HomeViewController.swift
//  MyChatAdvanced
//
//  Created by Andrea Sponziello on 02/11/2019.
//  Copyright © 2019 Frontiere21 SRL. All rights reserved.
//

import UIKit
import Chat21
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerAction(_ sender: Any) {
        let email = "andre1@email.it"; /** FIREBASE USER EMAIL **/
        let password = "123456"; /** FIREBASE USER PASSWORD **/
        ChatAuth.createUser(withEmail: email, password: password) { (user, error) in
            if let user = user {
                print("user created " + user.userId)
                user.firstname = "John";
                user.lastname = "Nash";
                let chatm = ChatManager.getInstance()
                chatm?.createContact(for: user, withCompletionBlock: { (error) in
                    print("Contact successfully created.")
                    // then initialize chat with the just created user
                    chatm?.start(with: user)
                })
            }
        }
    }
    
    @IBAction func signinAction(_ sender: Any) {
        let email = "andrea@email.it"; /** FIREBASE USER EMAIL **/
        let password = "123456"; /** FIREBASE USER PASSWORD **/
        ChatAuth.auth(withEmail: email, password: password) { (user, error) in
            if let err = error {
                print("Authentication error: ", err.localizedDescription);
            }
            else {
                if let user = user {
                    user.firstname = "John";
                    user.lastname = "Nash";
                    let chatm = ChatManager.getInstance()
                    chatm?.start(with: user)
                    chatm?.createContact(for: user, withCompletionBlock: { (error) in
                        print("Contact successfully created.")
                    })
                }
            }
        }
    }
    
    @IBAction func openConversationsAction(_ sender: Any) {
        ChatUIManager.getInstance()?
            .openConversationsView(
                asModal: self,
                withCompletionBlock: nil)
    }
    
    @IBAction func getConversationView(_ sender: Any) {
        let conversationsVC: UINavigationController? = ChatUIManager.getInstance()?
            .getConversationsViewController()
        print("conversations vc \(conversationsVC)")
    }
    
    @IBAction func selectContactAction(_ sender: Any) {
        ChatUIManager.getInstance()?.openSelectContactView(asModal: self, withCompletionBlock: { (user, canceled) in
            if (canceled) {
                print("select user was canceled.")
            }
            else if let user = user {
                print("selected contact: \(String(describing: user.fullname)) \(String(describing: user.lastname)).")
            }
            else {
                print("Error, no user defined.")
            }
        })
    }
    
    @IBAction func writeToAction(_ sender: Any) {
        
        ChatUIManager.getInstance()?.openSelectContactView(asModal: self, withCompletionBlock: { (contact, canceled) in
            if (canceled) {
                print("select user was canceled.")
            }
            else {
                print("selected contact: \(contact?.fullname) \(contact?.lastname).")
                ChatUIManager.getInstance()?.openConversationMessagesViewAsModal(with: contact, viewController: self, withCompletionBlock: { () in
                    print("Messages view dismissed.");
                });
            }
        })
    }
    
    @IBAction func plugProfileView(_ sender: Any) {
        plugProfileView()
    }
    
    func plugProfileView() {
        ChatUIManager.getInstance()?.pushProfileCallback = { (user, vc) in
            print("profile view render")
            let storyboard: UIStoryboard  = UIStoryboard.init(name: "Main", bundle: nil);
            let profileVC: ProfileViewController = storyboard.instantiateViewController(withIdentifier: "user-profile-vc") as! ProfileViewController
            profileVC.user = user
            vc?.navigationController?.pushViewController(profileVC, animated: true)
        }
        print("profile view plugged in chat21")
    }
    
    @IBAction func signinFirebase(_ sender: Any) {
        let email = "andrea@email.it"; /** FIREBASE USER EMAIL **/
        let password = "123456"; /** FIREBASE USER PASSWORD **/
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Error while authenticating: \(error)")
            }
            else if let result = result {
                let firebase_user: User = result.user
                let user: ChatUser = ChatUser()
                user.userId = firebase_user.uid
                user.email = email
                user.firstname = "John";
                user.lastname = "Nash";
                let chatm = ChatManager.getInstance()
                chatm?.start(with: user)
                chatm?.createContact(for: user, withCompletionBlock: { (error) in
                    print("Contact successfully created.")
                })
            }
        }
    }
    
    @IBAction func plugSelectContactAction(_ sender: Any) {
        let storyboard: UIStoryboard  = UIStoryboard.init(name: "Main", bundle: nil);
        let select_user_vc: MySelectContactViewController = storyboard.instantiateViewController(withIdentifier: "select-user-vc") as! MySelectContactViewController
        ChatUIManager.getInstance()?.selectUserViewController = select_user_vc;
        print("Custom Select Contact View plugged in")
    }
    
    @IBAction func writeToSomeoneAction(_ sender: Any) {
        let contact: ChatUser = ChatUser()
        contact.userId = "5aaa99024c3b110014b478f0";
        contact.firstname = "Andrew";
        contact.lastname = "Leo";
        ChatUIManager.getInstance()?.openConversationMessagesViewAsModal(with: contact, viewController: self, withCompletionBlock: { () in
            print("Messages view dismissed.");
        });
    }
}

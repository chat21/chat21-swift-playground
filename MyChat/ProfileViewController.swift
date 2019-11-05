//
//  ProfileViewController.swift
//  MyChatAdvanced
//
//  Created by Andrea Sponziello on 02/11/2019.
//  Copyright © 2019 Frontiere21 SRL. All rights reserved.
//

import UIKit
import Chat21

class ProfileViewController: UIViewController {
    
    var user: ChatUser? = nil;
    
    @IBOutlet weak var lastnameLabel: UILabel!
    
    @IBOutlet weak var firstnameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var userIdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        if let user = user {
            print("email: \(String(describing: user.email))")
            firstnameLabel.text = user.firstname
            lastnameLabel.text = user.lastname
            emailLabel.text = user.email
            userIdLabel.text = user.userId
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

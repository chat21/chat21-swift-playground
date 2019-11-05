//
//  MySelectContactViewController.swift
//  MyChatAdvanced
//
//  Created by Andrea Sponziello on 05/11/2019.
//  Copyright © 2019 Frontiere21 SRL. All rights reserved.
//

import UIKit
import Chat21

class MySelectContactViewController: UIViewController, ChatSelectContactProtocol {
    
    var completionCallback: ((ChatUser?, Bool) -> Void)?
    
//    @property (nonatomic, copy) void (^ _Nonnull completionCallback)( ChatUser * _Nullable contact, BOOL canceled);
//    var completionCallback : ((ChatUser?, UIViewController) -> (Void))?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func selectContactAction(_ sender: Any) {
        let selectedUser: ChatUser = ChatUser();
        selectedUser.userId = "5aaa99024c3b110014b478f0";
        selectedUser.firstname = "Andrea";
        selectedUser.lastname = "Leo";
        if let callback = self.completionCallback {
            self.dismiss(animated: true) {
                callback(selectedUser, false);
            }
        }
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        if let callback = self.completionCallback {
            self.dismiss(animated: true) {
                callback(nil, true);
            }
        }
    }
    
}

//
//  BuildAccountViewController.swift
//  CCCC Eat
//
//  Created by chang on 2020/5/15.
//  Copyright © 2020 ChangYaWen. All rights reserved.
//

import UIKit

class BuildAccountViewController: UIViewController {

    @IBOutlet weak var accountEntry : UITextField!
    @IBOutlet weak var passwordEntry: UITextField!
    
    @IBAction func moveToPersonalinfoSegue(_ sender: Any) {
        

        guard let account : String = self.accountEntry.text else {
            self.accountEntry.becomeFirstResponder()
            return
        }
        
        guard let password : String = self.passwordEntry.text else {
            self.passwordEntry.becomeFirstResponder()
            return
        }
        
        AppDelegate.currentUserProfile.account = account
        AppDelegate.currentUserProfile.password = password
        
        self.performSegue(withIdentifier: "moveToPersonalinfoSegue", sender: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

extension BuildAccountViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if 101 == textField.tag {
            self.passwordEntry.becomeFirstResponder()
        }
        else{
            textField.resignFirstResponder()
        }
        
        return true
    }
}

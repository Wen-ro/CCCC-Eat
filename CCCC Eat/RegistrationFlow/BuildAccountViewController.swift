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
            
            self.showToast(message: "請填寫帳號", font: .systemFont(ofSize: 14))
            self.accountEntry.becomeFirstResponder()
            
            return
        }
        let trimaccount : String = account.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimaccount.count == 0 {
            self.showToast(message: "帳號不能使用空白字元", font: .systemFont(ofSize: 14))
            self.accountEntry.becomeFirstResponder()
            
            return
        }
        
        guard let password : String = self.passwordEntry.text else {
            
            self.showToast(message: "密碼不能為空", font: .systemFont(ofSize: 14))
            self.passwordEntry.becomeFirstResponder()
            
            return
        }
        let trimpassword : String = password.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimpassword.count == 0 {
            self.showToast(message: "密碼不能使用空白字元", font: .systemFont(ofSize: 14))
            self.passwordEntry.becomeFirstResponder()
            
            return
        }
        
        AppDelegate.currentUserProfile.account = trimaccount
        AppDelegate.currentUserProfile.password = trimpassword
        
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

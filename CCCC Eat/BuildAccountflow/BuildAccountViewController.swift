//
//  BuildAccountViewController.swift
//  CCCC Eat
//
//  Created by chang on 2020/5/15.
//  Copyright © 2020 ChangYaWen. All rights reserved.
//

import UIKit
import Alamofire

class BuildAccountViewController: UIViewController {

    @IBOutlet weak var NewAccountEntry: UITextField!
    
    @IBAction func moveToPersonalinfoSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "moveToPersonalinfoSegue", sender: self)
        
        
        
        
        
        
        
    }
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

}

extension BuildAccountViewController: UITextFieldDelegate{
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //利用此方式讓按下Return後會Toogle 鍵盤讓它消失
        textField.resignFirstResponder()
        print("按下Return")
        return false
    }
}

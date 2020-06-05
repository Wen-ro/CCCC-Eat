//
//  FirstpageViewController.swift
//  CCCC Eat
//
//  Created by chang on 2020/6/5.
//  Copyright © 2020 ChangYaWen. All rights reserved.
//

import UIKit

class FirstpageViewController: UIViewController {
    
    @IBAction func moveToSigninButton(_ sender: Any) {
        self.performSegue(withIdentifier: "moveToSigninSegue", sender: self)
        
        
    }
    @IBAction func moveToRegisterButton(_ sender: Any) {
        self.performSegue(withIdentifier: "moveToRegisterSegue", sender: self)
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

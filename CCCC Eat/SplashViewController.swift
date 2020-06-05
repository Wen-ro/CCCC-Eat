//
//  SplashViewController.swift
//  CCCC Eat
//
//  Created by chang on 2020/5/12.
//  Copyright © 2020 ChangYaWen. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    var asyncWorker : AsyncRequestWorker = AsyncRequestWorker()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.isHidden = true
        
        
        asyncWorker.reponseDelegate = self
        
        asyncWorker.getResponse(from: "https://smartfood.azurewebsites.net", tag: 0)
        
        
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


extension SplashViewController : AsyncReponseDelegate {
    func receviedReponse(_ sender: AsyncRequestWorker, responseString: String, tag: Int) {
        
        
        print(responseString)
    }
    
    func receivedErrorMessage(_ sender: AsyncRequestWorker, errorString: String, tag: Int) {
        
        
        print(errorString)
    }
    
    
    
    
    
    
}

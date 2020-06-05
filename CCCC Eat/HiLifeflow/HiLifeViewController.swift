//
//  HiLifeViewController.swift
//  CCCC Eat
//
//  Created by chang on 2020/5/12.
//  Copyright © 2020 ChangYaWen. All rights reserved.
//

import UIKit
import Alamofire

class HiLifeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        AF.request("https://smartfood.azurewebsites.net/api/FoodApi").responseString(completionHandler: {
        response
        in
        
        switch( response.result ){
        case let .success(value) :
        
            print(value)
            //print(response.response!.statusCode)
            
            // 注意 guard 的使用方法。
            guard 200 == response.response!.statusCode else {
                
                
                
                return
            }
            
            
            break;
        case let .failure(error) :
            
            print(error.localizedDescription)
            break;
        }
        
        })
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

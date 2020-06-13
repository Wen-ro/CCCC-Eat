//
//  ChoosestoreViewController.swift
//  CCCC Eat
//
//  Created by chang on 2020/5/12.
//  Copyright © 2020 ChangYaWen. All rights reserved.
//

import UIKit
import Alamofire

class ChoosestoreViewController: UIViewController {

    @IBAction func moveToMenu(_ sender: Any) {
        self.performSegue(withIdentifier: "moveToMenu", sender: self)
    }

    var registrationInfo : Registration?
    
    @IBOutlet weak var GenderLabel: UILabel!
    @IBOutlet weak var AgeLabel: UILabel!
    @IBOutlet weak var WorkLabel: UILabel!
    @IBOutlet weak var HeightLabel: UILabel!
    @IBOutlet weak var WeightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GenderLabel.text = "\(String(describing: registrationInfo?.userGender))"
        AgeLabel.text = "\(String(describing: registrationInfo?.userAge))"
        WorkLabel.text = (registrationInfo?.userWorkingType).map { $0.rawValue }
        HeightLabel.text = "\(String(describing: registrationInfo?.userHeight))"
        WeightLabel.text = "\(String(describing: registrationInfo?.userWeight))"
        
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        UINavigationBar.appearance().shadowImage = UIImage()
        
        // Do any additional setup after loading the view.
        
        AF.request("https://smartfood.azurewebsites.net/api/ProfileApi/2").responseString(completionHandler: {
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
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}

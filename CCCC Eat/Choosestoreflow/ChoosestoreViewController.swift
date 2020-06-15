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

    var registrationInfo : Registration!
    var fromRegistrationView : Bool = false
    
    @IBOutlet weak var GenderLabel: UILabel!
    @IBOutlet weak var AgeLabel: UILabel!
    @IBOutlet weak var WorkLabel: UILabel!
    @IBOutlet weak var HeightLabel: UILabel!
    @IBOutlet weak var WeightLabel: UILabel!
    
    @IBOutlet weak var TotalCalLabel: UILabel!
    @IBOutlet weak var CarbohydrateLabel: UILabel!
    @IBOutlet weak var ProteinLabel: UILabel!
    @IBOutlet weak var FatLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if fromRegistrationView {
            GenderLabel.text = self.registrationInfo.userGender.rawValue
            AgeLabel.text =  "\( self.registrationInfo.userAge )"
            WorkLabel.text = self.registrationInfo.userWorkingType.rawValue
            HeightLabel.text = "\( self.registrationInfo.userHeight )"
            WeightLabel.text = "\( self.registrationInfo.userWeight )"
        }
        else{
            
            GenderLabel.text = AppDelegate.currentUserProfile.userGender.rawValue
            AgeLabel.text =  "\( AppDelegate.currentUserProfile.age )"
            WorkLabel.text = AppDelegate.currentUserProfile.userWorkingType.rawValue
            HeightLabel.text = "\( AppDelegate.currentUserProfile.height )"
            WeightLabel.text = "\( AppDelegate.currentUserProfile.weight )"
        }
        
        
        
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
        /*
        let idealweight = (Float( HeightLabel.text! ) - 100)*0.9
        if WorkLabel.text == "輕度" {
            TotalCalLabel.text = "\(idealweight * 25)"
            CarbohydrateLabel.text = (Float(TotalCalLabel.text) * 0.65) % 4
            ProteinLabel.text = (Float(TotalCalLabel.text) * 0.15) % 4
            FatLabel.text = (Float(TotalCalLabel.text) * 0.2) % 9
        }
        if WorkLabel.text == "中度" {
            TotalCalLabel.text = "\(idealweight * 30)"
            CarbohydrateLabel.text = (Float(TotalCalLabel.text) * 0.65) % 4
            ProteinLabel.text = (Float(TotalCalLabel.text) * 0.15) % 4
            FatLabel.text = (Float(TotalCalLabel.text) * 0.2) % 9
        }
        if WorkLabel.text == "重度" {
            TotalCalLabel.text = "\(idealweight * 35)"
            CarbohydrateLabel.text = (Float(TotalCalLabel.text) * 0.65) % 4
            ProteinLabel.text = (Float(TotalCalLabel.text) * 0.15) % 4
            FatLabel.text = (Float(TotalCalLabel.text) * 0.2) % 9
        }
        */
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}



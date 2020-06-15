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

        GenderLabel.text = AppDelegate.currentUserProfile.userGender.rawValue
        AgeLabel.text =  "\( AppDelegate.currentUserProfile.age ) 歲"
        WorkLabel.text = AppDelegate.currentUserProfile.userWorkingType.rawValue
        HeightLabel.text = "\( AppDelegate.currentUserProfile.height ) 公分"
        WeightLabel.text = "\( AppDelegate.currentUserProfile.weight ) 公斤"
        

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
        
        let expectWeight : Float = ( AppDelegate.currentUserProfile.height - 100 ) * 0.9
        var expectCalorie : Float = 0
        
        switch AppDelegate.currentUserProfile.userWorkingType {
        case .Heavy:
            expectCalorie = expectWeight * 35
            
            break
        case .Medium:
            expectCalorie = expectWeight * 30
            
            break
        case .Light:
            expectCalorie = expectWeight * 25
            
            break
        }
        
        // 為了除法，先乘以 100
        let expectCarbohydrate : Float = ( expectCalorie * 65 ) / 400
        let expectProtein : Float = ( expectCalorie * 15) / 400
        let expectFat : Float = ( expectCalorie * 20) / 900
        
        //
        TotalCalLabel.text = "\(expectCalorie.rounded()) 大卡"
        CarbohydrateLabel.text = "\(expectCarbohydrate.rounded()) g"
        ProteinLabel.text = "\(expectProtein.rounded()) g"
        FatLabel.text = "\(expectFat.rounded()) g"
        
        
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



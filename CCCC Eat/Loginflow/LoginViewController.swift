//
//  LoginViewController.swift
//  CCCC Eat
//
//  Created by chang on 2020/5/12.
//  Copyright © 2020 ChangYaWen. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class LoginViewController: UIViewController {
    
    @IBOutlet weak var LoginEntry: UITextField!
    @IBAction func moveToChoosestoreButton(_ sender: Any) {
        self.performSegue(withIdentifier: "moveToChoosestoreSegue1", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        AF.request("https://smartfood.azurewebsites.net/api/ProfileApi/2").responseString(completionHandler: {
        response
        in
        
        switch( response.result ){
        case let .success(value) :
            
            do {
                // 使用 SwiftyJSON 解析 JSON
                if let dataFromString = value.data(using: .utf8,allowLossyConversion: false) {
                    
                    
                    let json = try JSON(data: dataFromString)
                    
                    AppDelegate.currentUserProfile = DisplayProfile()
                    
                    AppDelegate.currentUserProfile.id = json["id"].intValue
                    AppDelegate.currentUserProfile.nickName = json["name"].stringValue
                    let birthdayString = json["birthday"].stringValue
                    
                    let formatter: DateFormatter = DateFormatter()
                    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                    let birthday = formatter.date(from: birthdayString )!
                    let today = Date()
                    
                    let calendar = Calendar.current
                    let date1 = calendar.startOfDay(for: birthday)
                    let date2 = calendar.startOfDay(for: today)

                    let components = calendar.dateComponents([.year], from: date1, to: date2)
                    AppDelegate.currentUserProfile.age = components.year!
                    
                    AppDelegate.currentUserProfile.height = json["height"].floatValue
                    AppDelegate.currentUserProfile.weight = json["weight"].floatValue
                    AppDelegate.currentUserProfile.expectDailyCalorie = json["expectDailyCalorie"].intValue
                    AppDelegate.currentUserProfile.expectBreakfastCalorie = json["expectBreakfastCalorie"].intValue
                    AppDelegate.currentUserProfile.expectLunchCalorie = json["expectLunchCalorie"].intValue
                    AppDelegate.currentUserProfile.expectDinnerCalorie = json["expectDinnerCalorie"].intValue
                    
                    let gender : String = json["gender"].stringValue
                    AppDelegate.currentUserProfile.userGender = gender == "男" ? .Male : .Female
                    
                }
                
            } catch  {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: NSLocalizedString("Error", comment: "Erro"), message:error.localizedDescription, preferredStyle: .alert )
                    
                    let action = UIAlertAction(title: NSLocalizedString("Confirm", comment: "Confirm"), style: .default, handler: { act in alert.dismiss(animated: true, completion: nil)  })
                    
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
            
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


extension LoginViewController: UITextFieldDelegate{
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

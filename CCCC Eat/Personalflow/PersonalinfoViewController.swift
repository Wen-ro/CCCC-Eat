//
//  PersonalinfoViewController.swift
//  CCCC Eat
//
//  Created by chang on 2020/5/12.
//  Copyright © 2020 ChangYaWen. All rights reserved.
//

import UIKit
import Alamofire

class PersonalinfoViewController: UIViewController {
    
    @IBOutlet weak var InfoEntry: UITextField!
    @IBOutlet weak var selectinfo: UILabel!
    @IBOutlet weak var infoPicker: UIPickerView!
    
    var genders : [String] = ["男", "女"]
    var jobs : [String] = ["輕度工作", "中度工作", "重度工作"]
    
    var registrationInfo : Registration?
    
    @IBAction func moveToChoosestoreButton(_ sender: Any) {
        self.performSegue(withIdentifier: "moveToChoosestoreSegue2", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //
        self.registrationInfo = Registration(userGender: .Male, userWorkingType: .Light)
        
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
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "moveToChoosestoreSegue2":
            
            let destination : ChoosestoreViewController = segue.destination as! ChoosestoreViewController
            
            destination.registrationInfo = self.registrationInfo
            
            break
        default:
            
            break
        }
    }

}
extension PersonalinfoViewController : UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //利用此方式讓按下Return後會Toogle 鍵盤讓它消失
        textField.resignFirstResponder()
        print("按下Return")
        return false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if( 101 == pickerView.tag ){
            return genders.count
        }
        if( 102 == pickerView.tag ){
            return jobs.count
        }
        
        return 0
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if( 101 == pickerView.tag ){
            return genders[row]
        }
        if( 102 == pickerView.tag ){
            return jobs[row]
        }
        return "N/A"
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        print("pickerView tag:\(pickerView.tag);component:\(component) ;row:\( row )")
        
        
        if( 101 == pickerView.tag ){
            let gender = genders[row]
            print(gender)
            
            self.registrationInfo?.userGender = row % 2 == 0 ? .Male : .Female
            
        if( 102 == pickerView.tag ){
            let job = jobs[row]
            print(job)
            
            switch row {
            case 0:
                self.registrationInfo?.userWorkingType = .Light
                break
            case 1:
                self.registrationInfo?.userWorkingType = .Medium
                break
            case 2:
                self.registrationInfo?.userWorkingType = .Heavy
                break
            default:
                
                break
            }
            
            
        }
    }
}
}


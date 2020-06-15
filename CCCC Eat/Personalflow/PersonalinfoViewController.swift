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
    
    @IBOutlet weak var genderContainerView: UIView!
    @IBOutlet weak var workingTypeContainerView: UIView!
    @IBOutlet weak var WeightInput: UITextField!
    @IBOutlet weak var HeightInput: UITextField!
    @IBOutlet weak var AgeInput: UITextField!
    
    @IBOutlet weak var InfoEntry: UITextField!
    @IBOutlet weak var selectinfo: UILabel!
    @IBOutlet weak var infoPicker: UIPickerView!
    
    @IBOutlet weak var workingTypePicker: UIPickerView!
    
    var genders : [String] = ["男", "女"]
    var jobs : [String] = ["輕度工作", "中度工作", "重度工作"]
    
    
    
    @IBAction func moveToChoosestoreButton(_ sender: Any) {
        
        var profile : Profile = Profile()
        
        profile.name = self.InfoEntry.text ?? "N/A"
        
        if infoPicker.selectedRow(inComponent: 0) % 2 == 0  {
            AppDelegate.currentUserProfile.userGender = .Male
            profile.gender = "男"
        }
        else{
            AppDelegate.currentUserProfile.userGender = .Female
            profile.gender = "女"
        }
        
        
        switch workingTypePicker.selectedRow(inComponent: 0) {
        case 0:
            AppDelegate.currentUserProfile.userWorkingType = .Light
            break
        case 1:
            AppDelegate.currentUserProfile.userWorkingType = .Medium
            break
        case 2:
            AppDelegate.currentUserProfile.userWorkingType = .Heavy
            break
        default:
            
            break
        }
        
        // 這邊停下來檢查，需要輸入的值在不在。
        AppDelegate.currentUserProfile.name = self.InfoEntry.text!
        
        let age : Int = Int( self.AgeInput.text! ) ?? 18
        AppDelegate.currentUserProfile.age = age
        
        let height : Float = Float( self.HeightInput.text! ) ?? 170.0
        AppDelegate.currentUserProfile.height = height
        profile.height = Int( height )
        
        let weight : Float = Float( self.WeightInput.text! ) ?? 55.0
        AppDelegate.currentUserProfile.weight = weight
        profile.weight = Int( weight )
        
        
        

        //
        let jsonEncoder = JSONEncoder()
        let profileJsonData = try! jsonEncoder.encode(profile)
        
        var urlRequest = URLRequest(url: URL(string: "https://supershop.azurewebsites.net/api/ProfileApi")!)
        urlRequest.httpBody = profileJsonData
        urlRequest.method = .post
        urlRequest.headers.add( HTTPHeader(name: "Content-Type", value: "application/json"))
        
        
        
        self.performSegue(withIdentifier: "moveToChoosestoreSegue2", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //
        self.genderContainerView.layer.cornerRadius = 20
        self.workingTypeContainerView.layer.cornerRadius = 20
        //
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "moveToChoosestoreSegue2":
            
            let destination : ChoosestoreViewController = segue.destination as! ChoosestoreViewController
            
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //利用此方式讓按下Return後會Toogle 鍵盤讓它消失
        textField.resignFirstResponder()
        print("按下Return")
        //print 出自輸入的值
        print(textField.text ?? "")
        

        // 去 Storyboard 屬性設定下，看 tag 的設定
        switch textField.tag {
        case 101:
            AppDelegate.currentUserProfile.name = textField.text!
            break
        case 102:
            let age : Int = Int( textField.text! ) ?? 18
            AppDelegate.currentUserProfile.age = age
            break
        case 103:
            let height : Float = Float( textField.text! ) ?? 170.0
            AppDelegate.currentUserProfile.height = height
            break
        case 104:
            let weight : Float = Float( textField.text! ) ?? 55.0
            AppDelegate.currentUserProfile.weight = weight
            break
        default:
            
            break
        }
        
        
        
        
        
        
        
        
        return true
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
            
            AppDelegate.currentUserProfile.userGender = row % 2 == 0 ? .Male : .Female
            
        if( 102 == pickerView.tag ){
            let job = jobs[row]
            print(job)
            
            switch row {
            case 0:
                AppDelegate.currentUserProfile.userWorkingType = .Light
                break
            case 1:
                AppDelegate.currentUserProfile.userWorkingType = .Medium
                break
            case 2:
                AppDelegate.currentUserProfile.userWorkingType = .Heavy
                break
            default:
                
                break
            }
            
            
        }
    }
}
}


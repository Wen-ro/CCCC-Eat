//
//  PersonalinfoViewController.swift
//  CCCC Eat
//
//  Created by chang on 2020/5/12.
//  Copyright © 2020 ChangYaWen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PersonalinfoViewController: UIViewController {
    
    @IBOutlet weak var genderContainerView: UIView!
    @IBOutlet weak var workingTypeContainerView: UIView!
    @IBOutlet weak var WeightEntry: UITextField!
    @IBOutlet weak var HeightEntry: UITextField!
    @IBOutlet weak var AgeEntry: UITextField!
    
    @IBOutlet weak var NickNameEntry: UITextField!
    
    @IBOutlet weak var selectinfo: UILabel!
    @IBOutlet weak var infoPicker: UIPickerView!
    
    @IBOutlet weak var workingTypePicker: UIPickerView!
    
    var genders : [String] = ["男", "女"]
    var jobs : [String] = ["輕度工作", "中度工作", "重度工作"]
    
    @IBAction func moveToChoosestoreButton(_ sender: Any) {
        
        guard let age : Int = Int( self.AgeEntry.text! ) else {
            self.showToast(message: "請填寫年齡", font: .systemFont(ofSize: 14))
            
            DispatchQueue.main.async {
                self.AgeEntry.becomeFirstResponder()
            }
            return
        }
        
        guard let nickName : String = self.NickNameEntry.text else {
            self.showToast(message: "請填寫暱稱", font: .systemFont(ofSize: 14))
            
            DispatchQueue.main.async {
                self.NickNameEntry.becomeFirstResponder()
            }
            return
        }
        
        guard let height : Float = Float( self.HeightEntry.text! ) else {
           self.showToast(message: "請填寫身高", font: .systemFont(ofSize: 14))
           
           DispatchQueue.main.async {
               self.HeightEntry.becomeFirstResponder()
           }
           return
        }
        
        guard let weight : Float = Float( self.WeightEntry.text! ) else {
            self.showToast(message: "請填寫體重", font: .systemFont(ofSize: 14))

            DispatchQueue.main.async {
                self.WeightEntry.becomeFirstResponder()
            }
            return
        }
        
        
        let profile : Profile = Profile()
        
        profile.nickName = self.NickNameEntry.text ?? "N/A"
        
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
            profile.userWorkingType = 0
            break
        case 1:
            AppDelegate.currentUserProfile.userWorkingType = .Medium
            profile.userWorkingType = 1
            break
        case 2:
            AppDelegate.currentUserProfile.userWorkingType = .Heavy
            profile.userWorkingType = 2
            break
        default:
            
            break
        }
        
        // 這邊停下來檢查，需要輸入的值在不在。
        AppDelegate.currentUserProfile.nickName = nickName
        AppDelegate.currentUserProfile.age = age
        AppDelegate.currentUserProfile.height = height
        AppDelegate.currentUserProfile.weight = weight
        
        //
        let date = Date()
        guard let birthdayDate = Calendar.current.date(byAdding: .year, value: (age * -1), to: date) else { return  }
        
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        profile.birthday = format.string(from: birthdayDate)
        
        //
        profile.height = Int( height )
        profile.weight = Int( weight )
        profile.name = AppDelegate.currentUserProfile.account
        profile.password = AppDelegate.currentUserProfile.password
        profile.expectDailyCalorie = 0
        profile.expectBreakfastCalorie = 0
        profile.expectLunchCalorie = 0
        profile.expectDinnerCalorie = 0
        

        // 這邊將註冊的資料，轉為 JSON 之後上傳 Server
        let jsonEncoder = JSONEncoder()
        let profileJsonData = try! jsonEncoder.encode(profile)
        
        var urlRequest = URLRequest(url: URL(string: "https://smartfood.azurewebsites.net/api/ProfileApi")!)
        urlRequest.httpBody = profileJsonData
        urlRequest.method = .post
        urlRequest.headers.add( HTTPHeader(name: "Content-Type", value: "application/json"))
        
        
        AF.request( urlRequest ).responseJSON(completionHandler: {
            response
            in
            
            switch( response.result ){
                case let .success(value) :
                    
                    print(value)
                    
                    // 成功後，跳轉至主頁面。
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "moveToChoosestoreSegue2", sender: self)
                    }
                    
                break
                case let .failure(error) :
                    print(error.localizedDescription)
                break
                
            }
            
        })
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
            
//            let destination : ChoosestoreViewController = segue.destination as! ChoosestoreViewController
            
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
            AppDelegate.currentUserProfile.nickName = textField.text!
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


extension UIViewController {

func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }


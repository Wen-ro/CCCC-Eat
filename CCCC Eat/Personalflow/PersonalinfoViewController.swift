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
    var recond : [String] = []
    
    @IBAction func moveToChoosestoreButton(_ sender: Any) {
        self.performSegue(withIdentifier: "moveToChoosestoreSegue2", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension PersonalinfoViewController : UIPickerViewDelegate, UIPickerViewDataSource{
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
        if( 102 == pickerView.tag ){
            let job = jobs[row]
            print(job)
            
        
            recond = [genders[row], jobs[row]]
            print(recond[0], recond[1])
        }
    }
}
}
 
    // 按下Return後會反應的事件
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //利用此方式讓按下Return後會Toogle 鍵盤讓它消失
        textField.resignFirstResponder()
        print("按下Return")
        return false
    }
 

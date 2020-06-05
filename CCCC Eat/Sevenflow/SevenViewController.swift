//
//  SevenViewController.swift
//  CCCC Eat
//
//  Created by chang on 2020/5/12.
//  Copyright © 2020 ChangYaWen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SevenViewController: UIViewController {
    
    let fetures : [String] = ["Profile", "Sport", "Todo"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        AF.request("https://smartfood.azurewebsites.net/api/FoodApi").responseString(completionHandler: {
        response
        in
        
        switch( response.result ){
        case let .success(value) :
            //print(value)
            //print(response.response!.statusCode)
            
            if let dataFromString = value.data(using: .utf8, allowLossyConversion: false) {
                let json = try! JSON(data: dataFromString)
                
                //print(json)
                
                for (index,subJson):(String, JSON) in json {
                    // Do something you want
                    
                    
                    
                    
                    let name : String = subJson["name"].stringValue
                    let metabolicRate : Double = subJson["metabolicRate"].doubleValue
                    
                    print("\( name ): \( metabolicRate )")
                    
                }
                
                
            }
        
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
//extension SevenViewController : UITableViewDelegate, UITableViewDataSource {
    
    //func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return fetures.count
    //}
    
    //func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let name = self.fetures[ indexPath.row]
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: FeatureViewCell.identifier ) as! FeatureViewCell
        
        //cell.updateContent(title: name)
        
        //return cell
    //}
    
    //func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //tableView.deselectRow(at: indexPath, animated: true)
        
        //switch indexPath.row {
        //case 0:
            //self.performSegue(withIdentifier: "moveToRecommend", sender: self)
            //break
        //case 1:
            //self.performSegue(withIdentifier: "moveToMain", sender: self)
            //break
        //case 2:
            //self.performSegue(withIdentifier: "moveToSub", sender: self)
            //break
        //case 3:
            //self.performSegue(withIdentifier: "moveToDessert", sender: self)
            //break
        //case 4:
            //self.performSegue(withIdentifier: "moveToDRink", sender: self)
            //break
        //default:
            
            //break
        //}
        
    //}
    
//}

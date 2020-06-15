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

class MenuViewController : UIViewController {
    
    var foods : [Food] = []
    var selectedFood : Food?
    
    @IBOutlet weak var foodTable: UITableView!

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
                
                for (_,subJson):(String, JSON) in json {
                    // Do something you want
                    
                    
                    let name : String = subJson["name"].stringValue
                    let price : Double = subJson["price"].doubleValue
                
                    
                    print("\( name ): \( price )")
                    
                    var food : Food = Food()
                    
                    food.name = name
                    food.price = price
                    
                    self.foods.append(food)
                    
                }
                
                DispatchQueue.main.async {
                    self.foodTable.reloadData()
                }
                
                
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
        case "moveToFoodDetail":
            
            let destinationViewController : FoodDetailViewController = segue.destination as! FoodDetailViewController
            
            destinationViewController.selectedFood = selectedFood
            
            break
        default:
            
            break
        }
        
    }

}

extension MenuViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        let food : Food = self.foods[row]
        
        let cell : RecommendViewCell = tableView.dequeueReusableCell(withIdentifier: RecommendViewCell.identifier) as! RecommendViewCell
        
        cell.updateContent(food: food)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let row = indexPath.row
        
        self.selectedFood = self.foods[row]
        
        
        self.performSegue(withIdentifier: "moveToFoodDetail", sender: self)
        
//        switch indexPath.row {
//        case 0:
//            self.performSegue(withIdentifier: "moveToRecommend", sender: self)
//            break
//        case 1:
//            self.performSegue(withIdentifier: "moveToMain", sender: self)
//            break
//        case 2:
//            self.performSegue(withIdentifier: "moveToSub", sender: self)
//            break
//        case 3:
//            self.performSegue(withIdentifier: "moveToDessert", sender: self)
//            break
//        case 4:
//            self.performSegue(withIdentifier: "moveToDRink", sender: self)
//            break
//        default:
//
//            break
//        }
        
    }
    
}

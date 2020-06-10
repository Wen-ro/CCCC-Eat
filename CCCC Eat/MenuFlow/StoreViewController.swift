//
//  StoreViewController.swift
//  CCCC Eat
//
//  Created by chang on 2020/6/9.
//  Copyright © 2020 ChangYaWen. All rights reserved.
//

import UIKit

class MealSetViewController: UIViewController {

    var stores : [MealSet] = []
    var selectedStore : MealSet?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var seven : MealSet = MealSet()
        seven.name = "7-11"
        stores.append(seven)
        
        
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


extension MealSetViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        let store : MealSet = self.stores[row]
        
        let cell : StoreViewCell = tableView.dequeueReusableCell(withIdentifier: "StoreViewCell" ) as! StoreViewCell
        
        cell.updateContent(store: store)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let row = indexPath.row
        
        self.selectedStore = self.stores[row]
        
        
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

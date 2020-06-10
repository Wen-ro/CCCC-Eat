//
//  MealSetViewController.swift
//  CCCC Eat
//
//  Created by chang on 2020/6/9.
//  Copyright © 2020 ChangYaWen. All rights reserved.
//

import UIKit

class MealSetViewController: UIViewController {

    var mealSets : [MealSet] = []
    var selectedMealSet : MealSet?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var mealA : MealSet = MealSet()
        mealA.name = "A"
        mealSets.append(mealA)
        
        var mealB : MealSet = MealSet()
        mealB.name = "B"
        mealSets.append(mealB)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}


extension MealSetViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealSets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        let food : MealSet = self.mealSets[row]
        
        let cell : MealSetViewCell = tableView.dequeueReusableCell(withIdentifier: "MealSetViewCell" ) as! MealSetViewCell
        
        cell.updateContent(meal: food)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let row = indexPath.row
        
        self.selectedMealSet = self.mealSets[row]
        
        
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

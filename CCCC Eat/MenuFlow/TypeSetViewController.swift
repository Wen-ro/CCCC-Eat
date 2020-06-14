//
//  TypeSetViewController.swift
//  CCCC Eat
//
//  Created by chang on 2020/6/9.
//  Copyright © 2020 ChangYaWen. All rights reserved.
//

import UIKit

class TypeSetViewController: UIViewController {

    
    var TypeSets : [TypeSet] = []
    var selectedTypeSet : TypeSet?
    var FigureName = ["recommend", "sandwich", "rice", "noodles", "dessert", "beverage"]
    
    @IBOutlet weak var typeSetTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var typeA : TypeSet = TypeSet()
        typeA.name = "推薦組合"
        TypeSets.append(typeA)
        
        var typeB : TypeSet = TypeSet()
        typeB.name = "三明治"
        TypeSets.append(typeB)
        
        var typeC : TypeSet = TypeSet()
        typeC.name = "飯類"
        TypeSets.append(typeC)
        
        var typeD : TypeSet = TypeSet()
        typeD.name = "麵類"
        TypeSets.append(typeD)
        
        var typeE : TypeSet = TypeSet()
        typeE.name = "甜點"
        TypeSets.append(typeE)
        
        var typeF : TypeSet = TypeSet()
        typeF.name = "飲料"
        TypeSets.append(typeF)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}


extension TypeSetViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TypeSets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        let food : TypeSet = self.TypeSets[row]
        
        let cell : TypeSetViewCell = tableView.dequeueReusableCell(withIdentifier: TypeSetViewCell.identifier ) as! TypeSetViewCell
        
        cell.updateContent(meal: food, imageName: FigureName[row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let row = indexPath.row
        
        self.selectedTypeSet = self.TypeSets[row]
        
        
        self.performSegue(withIdentifier: "moveToMenuViewSegue", sender: self)
        
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

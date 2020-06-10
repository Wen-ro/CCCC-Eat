//
//  FoodDetail1ViewController.swift
//  CCCC Eat
//
//  Created by chang on 2020/6/9.
//  Copyright © 2020 ChangYaWen. All rights reserved.
//

import UIKit

class FoodDetail1ViewController: UIViewController {

        var selectedFood : Food?
        
        @IBOutlet weak var titleLabel: UILabel!
        
        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
            titleLabel.text = self.selectedFood?.name
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

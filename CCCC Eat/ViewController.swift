//
//  ViewController.swift
//  CCCC Eat
//
//  Created by chang on 2020/5/5.
//  Copyright © 2020 ChangYaWen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
           let tabBarIndex = tabBarController.selectedIndex
           if tabBarIndex == 0 {
               //do your stuff
           }
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
 
}



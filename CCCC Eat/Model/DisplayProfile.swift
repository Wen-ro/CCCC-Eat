//
//  Profile.swift
//  CCCC Eat
//
//  Created by 房懷安 on 2020/6/13.
//  Copyright © 2020 ChangYaWen. All rights reserved.
//

import Foundation
import Alamofire


// MARK: - Profile工作
class DisplayProfile {
    var id: Int = 0
    var name : String = "N/A"

    var age : Int = 0
    var height : Int = 0
    var weight : Int = 0
    
    var expectDailyCalorie : Int = 0
    var expectBreakfastCalorie : Int = 0
    var expectLunchCalorie : Int = 0
    var expectDinnerCalorie: Int = 0
    
    var userGender : Gender = Gender.Female
    var userWorkingType : WorkingType = WorkingType.Light
    
}





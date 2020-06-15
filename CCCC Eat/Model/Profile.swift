//
//  Profile.swift
//  CCCC Eat
//
//  Created by 房懷安 on 2020/6/14.
//  Copyright © 2020 ChangYaWen. All rights reserved.
//

import Foundation

class Profile : Codable {
    
    var id: Int = 0
    var name : String = "N/A"
    var nickName : String = "N/A"
    var password : String = "N/A"
    var gender: String = "N/A"
    var birthday: String = "N/A"
    var height : Int = 0
    var weight : Int = 0
    
    var expectDailyCalorie : Int = 0
    var expectBreakfastCalorie : Int = 0
    var expectLunchCalorie : Int = 0
    var expectDinnerCalorie: Int = 0
    
    var userWorkingType : Int = 0
    
}

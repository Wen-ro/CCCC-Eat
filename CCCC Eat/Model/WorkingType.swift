//
//  WorkingType.swift
//  CCCC Eat
//
//  Created by 房懷安 on 2020/6/13.
//  Copyright © 2020 ChangYaWen. All rights reserved.
//

import UIKit

struct Registration {
    var userGender : Gender
    var userAge : Age
    var userWorkingType : WorkingType
    var userName : UserNames
    var userHeight : Height
    var userWeight : Weight
}

enum Gender : Int {
    case Male = 1
    case Female = 2
}

enum WorkingType : String {
    case Heavy = "重度"
    case Medium = "中度"
    case Light = "輕度"
}

enum UserNames : String {
    case name = "Amy"
}
enum Height : Float {
    case h = 160
}
enum Weight : Float {
    case w = 50
}
enum Age : Int {
    case age = 25
}

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
    var userWorkingType : WorkingType
}

enum Gender : Int {
    case Male = 1
    case Female = 2
}

enum WorkingType : String {
    case Heavy = "重度工作"
    case Medium = "中度工作"
    case Light = "輕度工作"
}

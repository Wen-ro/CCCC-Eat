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
struct Profile: Codable {
    var id: Int
    var name, gender, birthday: String
    var height, weight, expectDailyCalorie, expectBreakfastCalorie: Int
    var expectLunchCalorie, expectDinnerCalorie: Int
}

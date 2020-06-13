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
    let id: Int
    let name, gender, birthday: String
    let height, weight, expectDailyCalorie, expectBreakfastCalorie: Int
    let expectLunchCalorie, expectDinnerCalorie: Int
}

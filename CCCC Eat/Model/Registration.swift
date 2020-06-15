//
//  Registration.swift
//  CCCC Eat
//
//  Created by 房懷安 on 2020/6/14.
//  Copyright © 2020 ChangYaWen. All rights reserved.
//

import UIKit

// 使用 enum ( enumerate )
// 例如：性別只有男女、工作型態只有輕中重
// 這時，使用 enum 可以限制使用行為。
enum Gender : String {
    case Male = "男"
    case Female = "女"
}

enum WorkingType : String {
    case Heavy = "重度"
    case Medium = "中度"
    case Light = "輕度"
}

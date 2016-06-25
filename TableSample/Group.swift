//
//  Group.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/06/22.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import Foundation
import RealmSwift

class Group: Object {
    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var imgName: String = ""
    dynamic var category: Category!
}
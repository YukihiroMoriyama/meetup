//
//  User.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/06/22.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var age: Int = 0
    let friends = List<Friend>()
}
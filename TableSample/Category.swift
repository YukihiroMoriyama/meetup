//
//  Category.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/06/25.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import RealmSwift
import ObjectMapper

class Category: Object {
    dynamic var id: Int = 0
    dynamic var name: String = ""
    
    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }
}

extension Category: Mappable {
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}
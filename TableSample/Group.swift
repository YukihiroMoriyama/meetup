//
//  Group.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/06/22.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import RealmSwift
import ObjectMapper

class Group: Object {
    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var imgName: String = ""
    dynamic var category: Category!
    let members = List<User>()
    
    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }
}

extension Group: Mappable {
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        imgName <- map["imgName"]
    }
}
//
//  User.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/06/22.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import RealmSwift
import ObjectMapper

class User: Object {
    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var minority: String = ""
    dynamic var age: Int = 0
    dynamic var desc: String = ""
    dynamic var imgName: String = ""
    let friends = List<Friend>()
    
    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }
}

extension User: Mappable {
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        minority <- map["minority"]
        age <- map["age"]
        desc <- map["desc"]
        imgName <- map["imgName"]
    }
}
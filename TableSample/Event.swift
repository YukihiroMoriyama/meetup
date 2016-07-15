//
//  Event.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/06/22.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import RealmSwift
import ObjectMapper

class Event: Object {
    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var desc: String = ""
    dynamic var date: NSDate = NSDate()
    dynamic var imgName: String = ""
    let members = List<User>()
    
    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }
}

extension Event: Mappable {
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        desc <- map["desc"]
        date <- (map["date"], CustomDateFormatTransform(formatString: "yyyy-MM-dd"))
        imgName <- map["imgName"]
    }
}
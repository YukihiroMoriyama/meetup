//
//  Event.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/06/22.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import Foundation
import RealmSwift

class Event: Object {
    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var desc: String = ""
    dynamic var date: NSDate = NSDate()
    dynamic var imgName: String = ""
    let members = List<User>()
}
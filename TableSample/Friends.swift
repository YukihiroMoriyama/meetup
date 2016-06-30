//
//  Friends.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/06/30.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import Foundation
import RealmSwift

class Friends: Object {
    dynamic var userId: Int = 0
    dynamic var users: List<User>
}
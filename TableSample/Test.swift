//
//  Test.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/06/25.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON
import ObjectMapper

class Test {
    func addEvent() {
        let event = Event()
        event.id = 1
        event.name = "甲子園好き集まれ"
        
        let comp = NSDateComponents()
        comp.year = 2016
        comp.month = 8
        comp.day = 8
        let cal = NSCalendar.currentCalendar()
        event.date = cal.dateFromComponents(comp)!
        
        event.desc = "今年も甲子園の時期がやってきました。一時の暑い夏のために流した多くの涙と汗。夢と青春を費やしてきた野球少年たちを一緒に応援しましょう！！"
        
        event.imgName = "imgres"
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(event)
        }
        
        let search = realm.objects(Event).first
        print(search)
    }
    
    func addCategory() {
        let path = NSBundle.mainBundle().pathForResource("category", ofType: "json")!
        let jsonData = NSData(contentsOfFile: path)!
        
        let json = JSON(data: jsonData)
        
        let realm = try! Realm()
        
        try! realm.write {
            for (_, subJson):(String, JSON) in json {
                let category: Category? = Mapper<Category>().map(subJson.dictionaryObject)
                realm.add(category!)
            }
        }
        
        let search = realm.objects(User)
        print(search)
    }
    
    func addUsers() {
        let path = NSBundle.mainBundle().pathForResource("users", ofType: "json")!
        let jsonData = NSData(contentsOfFile: path)!
        
        let json = JSON(data: jsonData)
        
        let realm = try! Realm()
        
        try! realm.write {
            for (_, subJson):(String, JSON) in json {
                let user: User? = Mapper<User>().map(subJson.dictionaryObject)
                realm.add(user!)
            }
        }
        
        let search = realm.objects(User)
        print(search)
        
    }
}

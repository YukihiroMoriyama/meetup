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
        
//        let comp = NSDateComponents()
//        comp.year = 2016
//        comp.month = 8
//        comp.day = 8
//        let cal = NSCalendar.currentCalendar()
//        event.date = cal.dateFromComponents(comp)!
        
        let path = NSBundle.mainBundle().pathForResource("events", ofType: "json")!
        let jsonData = NSData(contentsOfFile: path)!
        
        let json = JSON(data: jsonData)
        
        let realm = try! Realm()
        
        try! realm.write {
            for (_, subJson):(String, JSON) in json {
                let event: Event? = Mapper<Event>().map(subJson.dictionaryObject)
                realm.add(event!)
            }
        }
        
        let search = realm.objects(User)
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
    
    func addFriend() {
        let realm = try! Realm()
        let search = realm.objects(User).filter("id < 4")
        
        try! realm.write {
            for (i, u) in search.enumerate() {
                let friend = Friend()
                friend.id = i + 1
                friend.user = u
                realm.add(friend)
            }
        }
        
        let result = realm.objects(Friend)
        print(result)
    }
    
    func addGroup() {
        let path = NSBundle.mainBundle().pathForResource("group", ofType: "json")!
        let jsonData = NSData(contentsOfFile: path)!
        
        let json = JSON(data: jsonData)
        
        let realm = try! Realm()
        
        try! realm.write {
            for (_, subJson):(String, JSON) in json {
                let group: Group = Group()
                
                group.id = subJson["id"].intValue
                group.name = subJson["name"].string!
                group.imgName = subJson["imgName"].string!
                group.category = realm.objects(Category).filter("id == " + String(subJson["categoryId"].intValue)).first
                print(String(subJson["categoryId"].intValue))
                
                realm.add(group)
            }
        }
        
        let search = realm.objects(User)
        print(search)
        
    }
}

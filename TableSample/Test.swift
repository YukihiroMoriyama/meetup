//
//  Test.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/06/25.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import Foundation
import RealmSwift

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
        let realm = try! Realm()
        
        let category1 = Category()
        category1.id = 1
        category1.name = "おすすめ"
        
        let category2 = Category()
        category2.id = 2
        category2.name = "人気"
     
        let category3 = Category()
        category3.id = 3
        category3.name = "恋愛"
        
        let category4 = Category()
        category4.id = 4
        category4.name = "地元"
        
        let category5 = Category()
        category5.id = 5
        category5.name = "エンタメ"
        
        try! realm.write {
            realm.add(category1)
            realm.add(category2)
            realm.add(category3)
            realm.add(category4)
            realm.add(category5)
        }
        
        let search = realm.objects(Category)
        print(search)
    }
}

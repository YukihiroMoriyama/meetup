//
//  EventDetailViewController.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/06/22.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import UIKit
import RealmSwift

class EventDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let realm = try! Realm()
    var selectedId: Int!
    
    @IBOutlet var titleNavigationItem: UINavigationItem!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: CircleImageView!
    
    @IBOutlet var userCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userCollectionView.delegate = self
        userCollectionView.dataSource = self
        
        if let event = realm.objects(Event).filter("id == \(selectedId)").first {
            titleNavigationItem.title = event.name
            descriptionTextView.text = event.desc
            dateLabel.text = dateString(event.date)
            imageView.image = UIImage(named: event.imgName + ".jpg")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCellWithReuseIdentifier("memberCell", forIndexPath: indexPath) as! MemberCell
        
        let n = arc4random() % 20 + 1;
        
        let user = realm.objects(User).filter("id == \(n)").first
        
//        print(user)
        
        cell.circleImageView.image = UIImage(named: (user?.imgName)! + ".jpg")
        
        
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    
    func dateString(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        let dateString: String = dateFormatter.stringFromDate(date)
        return dateString
    }

    @IBAction func interest() {
        
    }
    
    @IBAction func join() {
        
    }
}

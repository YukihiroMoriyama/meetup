//
//  EventDetailViewController.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/06/22.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import UIKit
import RealmSwift

class EventDetailViewController: UIViewController {
    
    let realm = try! Realm()
    var selectedId: Int!
    
    @IBOutlet var titleNavigationItem: UINavigationItem!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

//
//  MyPageViewController.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/06/25.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import UIKit
import RealmSwift

class MyPageViewController: UIViewController {
    @IBOutlet var joinedGroupCollectionView: UICollectionView!
    
    let realm = try! Realm()
    let array: [String] = ["2", "6", "23", "30", "44"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        joinedGroupCollectionView.delegate = self
        joinedGroupCollectionView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        if (self.view.window == nil) {
            print("解放")
            self.view = nil
        }
    }
}

extension MyPageViewController: UICollectionViewDelegate { }

extension MyPageViewController: UICollectionViewDataSource {

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("joinedGroupCell", forIndexPath: indexPath) as! GroupCell
        
        if let group = realm.objects(Group).filter("id = \(array[indexPath.row])").first {
            cell.circleImageView.image = UIImage(named: "\(group.imgName).jpg")
            cell.titleLabel.text = group.name
        }
        
        return cell
    }
}

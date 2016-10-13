//
//  CategoryRow.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/06/25.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryRow: UITableViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let realm = try! Realm()
    var groups: [Group] = []
    var category: Int! {
        didSet {
            groups.removeAll()
            filterGroupByCategory()
            groupCollectionView.reloadData()
        }
    }

    @IBOutlet weak var groupCollectionView: UICollectionView!
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("groupCell", forIndexPath: indexPath) as! GroupCell
        
        autoreleasepool { 
            cell.group = groups[indexPath.row]
            cell.circleImageView.image = UIImage(named: "\(groups[indexPath.row].imgName).jpg")
        }
        
        
//        cell.circleImageView.layer.borderWidth = 0
        cell.titleLabel.text = "\(groups[indexPath.row].name)"

        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("groupCell", forIndexPath: indexPath) as! GroupCell
//        cell.circleImageView.layer.borderColor = UIColor.redColor().CGColor
//        cell.circleImageView.layer.borderWidth = 3
//        groupCollectionView.reloadData()
//        print(indexPath.row)
    }
    
    func filterGroupByCategory() {
        let result = realm.objects(Group)
        for re in result {
            if category == re.category.id {
                groups.append(re)
            }
        }
    }
}

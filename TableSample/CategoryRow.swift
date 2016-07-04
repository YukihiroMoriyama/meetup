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
        
        cell.group = groups[indexPath.row]
        cell.imageView.image = UIImage(named: "\(groups[indexPath.row].imgName).jpg")
        cell.titleLabel.text = "\(groups[indexPath.row].name)"

        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
    }
    
    func filterGroupByCategory() {
        let result = realm.objects(Group)
        for re in result {
            print(re)
            if category == re.category.id {
                groups.append(re)
            }
        }
    }
}

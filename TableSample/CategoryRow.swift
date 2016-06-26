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
    var category: Int! {
        didSet {
            groupCollectionView.reloadData()
        }
    }

    @IBOutlet weak var groupCollectionView: UICollectionView!
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("groupCell", forIndexPath: indexPath) as! GroupCell
        
        if let category = self.category {
            cell.imageView.image = UIImage(named: "cafe_2.jpg")
            cell.titleLabel.text = "\(category)-\(indexPath.row)"
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        let itemsPerRow:CGFloat = 4
//        let hardCodedPadding:CGFloat = 5
//        let itemWidth = (groupCollectionView.bounds.width / itemsPerRow) - hardCodedPadding
//        let itemHeight = groupCollectionView.bounds.height - (2 * hardCodedPadding)
//        return CGSize(width: itemWidth, height: itemHeight)
//    }
}

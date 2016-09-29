//
//  GroupDetailViewController.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/06/26.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import UIKit
import RealmSwift

class GroupDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let realm = try! Realm()
    var group: GroupCell? = nil
    
    @IBOutlet var groupImageView: UIImageView!
    @IBOutlet var titleNavigationItem: UINavigationItem!
    @IBOutlet var memberCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupImageView.image = group?.circleImageView.image
        titleNavigationItem.title = group?.titleLabel.text
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // セルの設定
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = memberCollectionView.dequeueReusableCellWithReuseIdentifier("member", forIndexPath: indexPath) as! MemberCell
        
        let array = ["user5", "user6", "user7", "user8"]
        
        cell.circleImageView.image = UIImage(named: array[indexPath.row % 4] + ".jpg")
        
        let n = arc4random() % 5 + 1;
        
        cell.label.text = "\(n)"
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellSize:CGFloat = self.memberCollectionView.contentSize.width / 2 - 2
        return CGSizeMake(cellSize, cellSize)
    }
    
    @IBAction func join() {
//        print(group)
        
    }
}

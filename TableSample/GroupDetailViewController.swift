//
//  GroupDetailViewController.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/06/26.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import UIKit

class GroupDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var group: GroupCell? = nil
    
    @IBOutlet var groupImageView: UIImageView!
    @IBOutlet var titleNavigationItem: UINavigationItem!
    @IBOutlet var memberCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupImageView.image = group?.imageView.image
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
        
        cell.imageView.image = UIImage(named: "kao_l2_1.jpg")
        cell.label.text = "1"
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellSize:CGFloat = self.view.frame.size.width/2-2
        return CGSizeMake(cellSize, cellSize)
    }
}

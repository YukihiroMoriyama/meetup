//
//  MyPageViewController.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/06/25.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
    
    @IBOutlet var ScrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ScrollView.contentSize.height = 1000
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

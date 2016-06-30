//
//  GroupTableViewController.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/06/25.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import UIKit
import RealmSwift

class GroupTableViewController: UITableViewController {
    let realm = try! Realm()
        
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return realm.objects(Category)[section].name
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return realm.objects(Category).count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! CategoryRow
        
        cell.category = realm.objects(Category)[indexPath.section].id
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let groupCell = sender as? GroupCell,
            let groupDetailPage = segue.destinationViewController as? GroupDetailViewController {
            groupDetailPage.group = groupCell
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

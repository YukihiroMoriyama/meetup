//
//  EventTimelineTableViewController.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/07/10.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import UIKit
import RealmSwift

class EventTimelineTableViewController: UITableViewController {
    
    let array: [String] = ["参加中", "参加予定"]
    var firstSectionArray = ["4"]
    var secondSectionArray = ["8", "7"]
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return array[section]
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return array.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        var count = 0
        if section == 0 {
            count = firstSectionArray.count
        } else {
            count = secondSectionArray.count
        }
        
        return count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("timelineCell", forIndexPath: indexPath) as! TimelineCell
        
        if indexPath.section == 0 {
            let event = realm.objects(Event).filter("id = \(firstSectionArray[indexPath.row])").first
            
            cell.circleImageView.image = UIImage(named: (event?.imgName)! + ".jpg")
            cell.nameLabel.text = (event?.name)!
            
            cell.userInteractionEnabled = true
            
        } else {

            let event = realm.objects(Event).filter("id = \(secondSectionArray[indexPath.row])").first
            
            cell.circleImageView.image = UIImage(named: (event?.imgName)! + ".jpg")
            cell.nameLabel.text = (event?.name)!
            
            cell.circleImageView.alpha = 0.5
            cell.nameLabel.alpha = 0.5
            
        }
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    

     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {        
         if editingStyle == .Delete {
         // Delete the row from the data source
            
            if indexPath.section == 0 {
                firstSectionArray.removeAtIndex(indexPath.row)
            } else {
                secondSectionArray.removeAtIndex(indexPath.row)
            }
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
         } else if editingStyle == .Insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
     }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            performSegueWithIdentifier("toTimelineTableViewController", sender: nil)
        }
    }
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}

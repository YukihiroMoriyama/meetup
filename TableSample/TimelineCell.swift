//
//  TimelineCell.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/07/10.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import UIKit

class TimelineCell: UITableViewCell {
    @IBOutlet var circleImageView: CircleImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

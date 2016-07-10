//
//  InfoCustomCell.swift
//  TableSample
//
//  Created by yukihiro moriyama on 2016/07/10.
//  Copyright © 2016年 YukihiroMoriyama. All rights reserved.
//

import UIKit

class InfoCustomCell: UITableViewCell {

    @IBOutlet weak var circleImageView: CircleImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

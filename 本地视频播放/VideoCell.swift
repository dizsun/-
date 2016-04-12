//
//  VideoCell.swift
//  本地视频播放
//
//  Created by SunDiz on 16/4/11.
//  Copyright © 2016年 SunDiz. All rights reserved.
//

import UIKit

struct video {
    let image:String
    let title:String
    let source:String
}


class VideoCell: UITableViewCell {
    
    @IBOutlet weak var videoScreenShot: UIImageView!
    
    @IBOutlet weak var videoTitleLabel: UILabel!
    
    var videoSourceLabel:String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

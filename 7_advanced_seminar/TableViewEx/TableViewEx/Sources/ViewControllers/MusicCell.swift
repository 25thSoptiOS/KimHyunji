//
//  MusicCell.swift
//  TableViewEx
//
//  Created by 김현지 on 2019/12/06.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class MusicCell: UITableViewCell {

// MusicTable - MusicCell - ContentView - Album
@IBOutlet var albumImg: UIImageView!
// MusicTable - MusicCell - ContentView - Title
@IBOutlet var musicTitle: UILabel!
// MusicTable - MusicCell - ContentView - Singer
@IBOutlet var singer: UILabel!

// 객체 초기화
override func awakeFromNib() {
    super.awakeFromNib()
    
    // Initialization code
    albumImg.layer.cornerRadius = 3
    albumImg.layer.masksToBounds = true
}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}

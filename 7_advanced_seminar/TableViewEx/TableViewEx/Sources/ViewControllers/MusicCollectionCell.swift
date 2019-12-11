//
//  MusicCollectionCell.swift
//  TableViewEx
//
//  Created by 김현지 on 2019/12/11.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class MusicCollectionCell: UICollectionViewCell {
    
    @IBOutlet var albumImg: UIImageView!
    @IBOutlet var musicTitle: UILabel!
    @IBOutlet var singer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        albumImg.layer.cornerRadius = 3
        albumImg.layer.masksToBounds = true
        
    }
    
}

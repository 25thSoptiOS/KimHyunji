//
//  MusicDetailVC.swift
//  TableViewEx
//
//  Created by 김현지 on 2019/12/06.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class MusicDetailVC: UIViewController {
    
    var albumImg: UIImage?
    var musicTitle: String?
    var singer: String?

    @IBOutlet var albumImgView: UIImageView!
    @IBOutlet var musicTitleLabel: UILabel!
    @IBOutlet var singerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setContents()
    }
    
    func setContents() {
        albumImgView.image = albumImg
        musicTitleLabel.text = musicTitle
        singerLabel.text = singer
    }


}

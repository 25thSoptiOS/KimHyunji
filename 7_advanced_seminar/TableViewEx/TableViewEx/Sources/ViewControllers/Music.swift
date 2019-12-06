//
//  Music.swift
//  TableViewEx
//
//  Created by 김현지 on 2019/12/06.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

// Music 모델입니다.
// 멤버 변수가 총 세 개인 Music 구조체를 생성했습니다.
struct Music {
    var albumImg: UIImage?
    var musicTitle: String
    var singer: String
    
    init(title: String, singer: String, coverName: String) {
        self.albumImg = UIImage(named: coverName)
        self.musicTitle = title
        self.singer = singer
    }
}

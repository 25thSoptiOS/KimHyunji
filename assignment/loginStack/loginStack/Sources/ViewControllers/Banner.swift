//
//  Banner.swift
//  loginStack
//
//  Created by 김현지 on 2019/10/26.
//  Copyright © 2019 김현지. All rights reserved.
//

import Foundation
import UIKit

struct Banner {
    var bannerImg: UIImage?
    
    init(bannerName: String) {
        self.bannerImg = UIImage(named: bannerName)
    }
}

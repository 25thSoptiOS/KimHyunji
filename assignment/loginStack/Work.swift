//
//  Work.swift
//  loginStack
//
//  Created by 김현지 on 2019/11/01.
//  Copyright © 2019 김현지. All rights reserved.
//

import Foundation
import UIKit

struct Work {
    var workImg: UIImage?
    
    init(workName: String) {
        self.workImg = UIImage(named: workName)
    }
}

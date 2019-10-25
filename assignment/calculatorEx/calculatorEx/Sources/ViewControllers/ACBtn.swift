//
//  ACBtn.swift
//  calculatorEx
//
//  Created by 김현지 on 2019/10/24.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class ACBtn: UIButton {

    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.backgroundColor = UIColor(red: 166/255, green: 166/255, blue: 166/255, alpha: 1)
        self.layer.cornerRadius = self.bounds.size.width * 0.5
    }
}

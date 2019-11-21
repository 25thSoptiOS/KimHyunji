//
//  RoundButton.swift
//  CustomCalculator
//
//  Created by 김현지 on 2019/11/21.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = self.bounds.size.width * 0.5
    }

}

//
//  CandleVC.swift
//  switchCandle
//
//  Created by 김현지 on 04/10/2019.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class CandleVC: UIViewController {

    @IBOutlet var candleImg: UIImageView!
    @IBOutlet var candleText: UILabel!
    
    let onImg = UIImage(named: "candle-on.jpg")
    let offImg = UIImage(named: "candle-off.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // sender를 Any가 아닌 UISwitch로 선언
    @IBAction func candleAction(_ sender: UISwitch) {
        // 스위치 on
        if sender.isOn {
            candleText.text = "On"
            candleImg.image = onImg
        }
        // 스위치 off
        else {
            candleText.text = "Off"
            candleImg.image = offImg
        }
    }
    

}

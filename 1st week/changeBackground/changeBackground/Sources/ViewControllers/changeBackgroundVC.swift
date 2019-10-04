//
//  changeBackgroundVC.swift
//  changeBackground
//
//  Created by 김현지 on 04/10/2019.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class changeBackgroundVC: UIViewController {
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // IBAction의 sender를 UISlider로 선언
    @IBAction func updateColor(_ sender: UISlider) {
        // 슬라이더 값을 받아와 view의 배경색 변경
        self.view.backgroundColor =
        UIColor.init(red:CGFloat(self.sliderRed.value),
        green: CGFloat(self.sliderGreen.value),
        blue: CGFloat(self.sliderBlue.value), alpha: 1.0)
    }

    

}

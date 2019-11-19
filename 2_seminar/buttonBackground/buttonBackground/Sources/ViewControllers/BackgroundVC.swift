//
//  BackgroundVC.swift
//  buttonBackground
//
//  Created by 김현지 on 2019/10/13.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class BackgroundVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segue 별로 이름을 지정할 수 있음
        // 여러 개의 segue 중 어떤 segue가 선택 되었는 지에 따라
        // 적절한 작업을 수행할 수 있도록 함
        
        let destination = segue.destination
        let button = sender as! UIButton
        
        // 버튼 텍스트와 동일한 텍스트를 결과 view에 title로 지정
        destination.title = button.titleLabel?.text
        
        // 버튼 색상과 동일한 색을 배경으로 지정
        destination.view.backgroundColor = button.titleColor(for: .normal)
    }

}

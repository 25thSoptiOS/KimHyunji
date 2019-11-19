//
//  firstVC.swift
//  segmentControl
//
//  Created by 김현지 on 04/10/2019.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class firstVC: UIViewController {
    
    // 세그먼트 IBOutlet
    @IBOutlet var leftRightSegControl: UISegmentedControl!
    // segment 상태를 문자열로 secont view에 전달하기 위한 변수
    var makeString: String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let destVC = segue.destination as! ResultVC
        let situation : String! = leftRightSegControl.titleForSegment(at: leftRightSegControl.selectedSegmentIndex)
        
        
        makeString = situation
        makeString += " 선택됨"
        
        // ViewController에서 정보를 받아 문자열 출력
        destVC.info = makeString
        
        // ViewController에서 Index를 받아 세그먼트 출력
        destVC.selectedSegmentIndex = leftRightSegControl.selectedSegmentIndex
    }
    
    
}

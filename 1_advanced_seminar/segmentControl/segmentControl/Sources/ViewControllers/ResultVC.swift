//
//  ResultVC.swift
//  segmentControl
//
//  Created by 김현지 on 08/10/2019.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {

    @IBOutlet var leftRightSegControl: UISegmentedControl!
    @IBOutlet var displayLabel: UILabel!
    
    var selectedSegmentIndex: Int!
    var info: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // String 변수를 사용해 segment 별 text를 저장한다.
        if let contentString = info
        {
            displayLabel.text = contentString
        }
        
        // Integer 변수를 사용해 segment 별 index를 저장한다.
        if let whichSelect = selectedSegmentIndex
        {
            leftRightSegControl.selectedSegmentIndex = whichSelect
        }
    }
    


}

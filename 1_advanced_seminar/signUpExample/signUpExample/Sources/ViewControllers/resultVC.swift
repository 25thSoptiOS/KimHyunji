//
//  resultVC.swift
//  signUpExample
//
//  Created by 김현지 on 08/10/2019.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class resultVC: UIViewController {

    @IBOutlet var userId: UILabel!
    
    var id: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userId.text = id
        
    }
    


}

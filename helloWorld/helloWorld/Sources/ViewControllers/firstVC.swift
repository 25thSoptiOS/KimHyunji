//
//  firstVC.swift
//  helloWorld
//
//  Created by 김현지 on 28/09/2019.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class firstVC: UIViewController {

    // 보통 override function 위에 연결
    @IBOutlet weak var firstLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // action은 override function 밑에 선언
    
    @IBAction func sayHello(_ sender: Any) {
        self.firstLabel.text = "SOPT!!!"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

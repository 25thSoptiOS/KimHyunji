//
//  secondVC.swift
//  helloWorld
//
//  Created by 김현지 on 28/09/2019.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class secondVC: UIViewController {

    @IBOutlet weak var secondLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saySopt(_ sender: Any) {
        self.secondLabel.text = "SOPT!!!"
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

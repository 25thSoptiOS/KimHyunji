//
//  ViewController.swift
//  SocialLogin
//
//  Created by 김현지 on 2019/12/07.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let loginBtn = FBLoginButton()
        loginBtn.permissions = ["email"]
        loginBtn.center = view.center   // auto layout 관련된 코드
        view.addSubview(loginBtn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAccessToken()
    }
    
    func getAccessToken() {
        guard let token = AccessToken.current else {return}
        
        print("### Access Token ###")
        print(token)
        print("### Access Token ###")
    }


}


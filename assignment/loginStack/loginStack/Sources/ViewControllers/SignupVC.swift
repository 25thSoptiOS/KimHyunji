//
//  SignupVC.swift
//  loginStack
//
//  Created by 김현지 on 2019/11/02.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {
    
    @IBOutlet var signupUserid: UITextField!
    @IBOutlet var signupPassword: UITextField!
    @IBOutlet var signupUsername: UITextField!
    @IBOutlet var signupPhone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func doSIgnup(_ sender: UIButton) {
        guard let id = signupUserid.text else { return }
        guard let pwd = signupPassword.text else { return }
        guard let name = signupUsername.text else { return }
        guard let phone = signupPhone.text else { return }
        
        SignupService.shared.signup(id, pwd, name, phone) {
            data in
            
            switch data {
                
            case .success(let data):
                
                let user_data = data as! ResponseDefault
                
                UserDefaults.standard.set(user_data.userIdx, forKey: "token")
                UserDefaults.standard.set(user_data.id, forKey: "id")
                UserDefaults.standard.set(user_data.password, forKey: "pwd")
                UserDefaults.standard.set(user_data.name, forKey: "name")
                UserDefaults.standard.set(user_data.phone, forKey: "phone")
                
                guard let login = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") else {return}
                self.present(login, animated: true)
                
            case .requestErr(let message):
                print(message)
                
            case .pathErr:
                print(".pathErr")
                
            case .serverErr:
                print(".serverErr")
                
            case .networkFail:
                print("네트워크 상태를 확인해주세요.")
            }
        }
    }
    
}

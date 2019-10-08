//
//  signUpVC.swift
//  signUpExample
//
//  Created by 김현지 on 08/10/2019.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class signUpVC: UIViewController, UITextFieldDelegate {

    // ID 텍스트필드 IBOutlet
    @IBOutlet var userId: UITextField!
    // Password 텍스트필드 IBOutlet
    @IBOutlet var loginPassword: UITextField!
    
    
    // ID를 저장할 문자열 변수
    var idString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // 키보드 done을 누르면 다음 텍스트 필드로 키보드 내려가게 하기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.userId {
            
            textField.resignFirstResponder()
            
            self.loginPassword.becomeFirstResponder()
        }
        
        textField.resignFirstResponder()
        
        return true
    }
    
    // Result View로 id값 넘기기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as! resultVC
        
        let id = userId.text!
        
        idString = "Your id is "
        idString += id
        
        resultVC.id = idString
        
    }

    
}

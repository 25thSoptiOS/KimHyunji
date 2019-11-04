//
//  LoginVC.swift
//  loginStack
//
//  Created by 김현지 on 2019/10/17.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

// 키보드 때문에 가려지지 않게 조정하는 extension
extension LoginVC: UIGestureRecognizerDelegate {
    
    func initGestureRecognizer() {
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        view.addGestureRecognizer(textFieldTap)
    }
    
    // 다른 위치 탭했을 때 키보드 없어지는 코드
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer) {
        self.loginUserid.resignFirstResponder()
        self.loginPassword.resignFirstResponder()
    }
    
    
    func gestureRecognizer(_ gestrueRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: loginUserid))! || (touch.view?.isDescendant(of: loginPassword))! {
            
            return false
        }
        return true
    }
    
    // keyboard가 보여질 때 어떤 동작을 수행
    @objc func keyboardWillShow(_ notification: NSNotification) {
        
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else { return }
        
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardHeight: CGFloat // 키보드의 높이
        
        if #available(iOS 11.0, *) {
            keyboardHeight = keyboardFrame.cgRectValue.height - self.view.safeAreaInsets.bottom
        } else {
            keyboardHeight = keyboardFrame.cgRectValue.height
        }
        
        // animation 함수
        // 최종 결과물 보여줄 상태만 선언해주면 애니메이션은 알아서
        // duration은 간격
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            
            self.logoImgView.alpha = 0
            
            // +로 갈수록 y값이 내려가고 -로 갈수록 y값이 올라간다. (부호변경)
            self.stackViewCenterY.constant = +keyboardHeight/2 + 50
        })
        
        self.view.layoutIfNeeded()
    }
    
    // keyboard가 사라질 때 어떤 동작을 수행
    @objc func keyboardWillHide(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            
            // 원래대로 돌아가도록
            self.logoImgView.alpha = 1.0
            self.stackViewCenterY.constant = 314.5
        })
        
        self.view.layoutIfNeeded()
    }
    
    
    // observer
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

class LoginVC: UIViewController {
    
    // 배경화면 이미지
    let backgroundImageView = UIImageView()
    // 스택뷰 센터 IBOutlet
    

    @IBOutlet var stackViewCenterY: NSLayoutConstraint!
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var loginUserid: UITextField!
    @IBOutlet var loginPassword: UITextField!
    @IBOutlet var logoImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initGestureRecognizer()
        
        // 버튼 테두리 색상, 두께 지정
        loginBtn.layer.borderColor = UIColor.white.cgColor
        loginBtn.layer.borderWidth = 1
        
        // 버튼 모서리 둥글게 하기
        loginBtn.layer.cornerRadius = 22
        setBackground()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
    
    @IBAction func doLogin(_ sender: UIButton) {
        guard let id = loginUserid.text else { return }
        guard let pwd = loginPassword.text else { return }
        
        // 싱글톤 패턴이기 때문에 다른 파일이어도 접근 가능
        LoginService.shared.login(id, pwd) {
            data in
            
            switch data {
                
            case .success(let data):
                
                // DataClass 에서 받은 유저 정보 반환
                let user_data = data as! DataClass
                
                // 사용자의 토큰, 이름, 전화번호 받아오기
                // 비밀번호는 안 받아와도 됨
                UserDefaults.standard.set(user_data.userIdx, forKey: "token")
                UserDefaults.standard.set(user_data.id, forKey: "id")
                UserDefaults.standard.set(user_data.password, forKey: "pwd")
                
                // instantiate -> 스토리보드 객체화하기
                guard let main = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") else {return}
                self.present(main, animated: true)
                
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
    
    
    
    func textFieldShouldReturn(_ textField : UITextField) -> Bool {
        if textField == self.loginUserid {
            textField.resignFirstResponder()
            self.loginPassword.becomeFirstResponder()
        }
        textField.resignFirstResponder()
        return true
    }
    
    // 백그라운드 이미지 설정하는 함수
    func setBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 154.5).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        backgroundImageView.image = UIImage(named: "bgImage")
        
        view.sendSubviewToBack(backgroundImageView)
    }

}

//
//  APIConstants.swift
//  loginStack
//
//  Created by 김현지 on 2019/11/02.
//  Copyright © 2019 김현지. All rights reserved.
//

struct APIConstants {
    // 전역 변수로 사용할 수 있게 APIConstants 선언하여 사용
    static let BaseURL = "http://106.10.59.71:3000/users"
    
    // 유저 (Users)
    static let LoginURL = BaseURL + "/signin" // 로그인
    static let SignupURL = BaseURL + "/signup" // 회원가입
}

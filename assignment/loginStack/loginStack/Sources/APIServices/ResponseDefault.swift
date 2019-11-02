//
//  ResponseSignup.swift
//  loginStack
//
//  Created by 김현지 on 2019/11/02.
//  Copyright © 2019 김현지. All rights reserved.
//

    // MARK: - ResponseString // 성공했을 때 response body
    struct ResponseDefault: Codable {
        let success: Bool
        let message: String
        let data: Int?
    }

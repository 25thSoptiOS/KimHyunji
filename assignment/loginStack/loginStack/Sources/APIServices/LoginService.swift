//
//  LoginService.swift
//  loginStack
//
//  Created by 김현지 on 2019/11/02.
//  Copyright © 2019 김현지. All rights reserved.
//

import Foundation
import Alamofire

struct LoginService {
    // Singleton 패턴 -> 프로그램의 어디서나 전역으로 사용할 수 있음. 프로그램의 생애주기에서 딱 하나의 객체 생성.
    static let shared = LoginService()
    
    // NetworkResult = 통신상태
    // escaping -> NetworkResult (통신상태) case 사용하기위해
    // id, pwd = body에 담을 파라미터 + escaping closure
    func login(_ id: String, _ pwd: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        // 파라미터로 값을 받아와서 body에 넣는다.
        let body: Parameters = [
            "id" : id,
            "pwd": pwd
        ]
        
        // Alamofire는 비동기 방식이기 때문에 response가 오기 전에 함수를 실행함.
        // 따라서 completion 핸들러를 escaping closure로 작성해 login 함수가 모두 반환된 후
        // 즉 response가 서버로부터 응답이온 후에 실행이 되도록 한다.
        Alamofire.request(APIConstants.LoginURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
            .responseData { response in
                
                //                print("request", response.request)
                //                print("response", response.response)
                //                print("data", response.data)
                //                print("result", response.result)
                
                // parameter 위치
                switch response.result {
                    
                // 통신 성공 - 네트워크 연결
                case .success:
                    if let value = response.result.value {
                        
                        if let status = response.response?.statusCode {
                            switch status {
                            case 200:
                                do {
                                    let decoder = JSONDecoder()
                                    print("value", value)
                                    let result = try decoder.decode(ResponseString.self, from: value)
                                    
                                    // ResponseString에 있는 success로 분기 처리
                                    // ResponseString에 있는 이름이 success
                                    switch result.success {
                                        
                                    case true:
                                        print("success")
                                        completion(.success(result.data!))
                                    case false:
                                        completion(.requestErr(result.message))
                                    }
                                }
                                catch {
                                    completion(.pathErr)
                                    print(error.localizedDescription)
                                    print(APIConstants.LoginURL)
                                }
                            case 400:
                                completion(.pathErr)
                            case 500:
                                completion(.serverErr)
                            default:
                                break
                            }// switch
                        }// iflet
                    }
                    break
                case .failure(let err):
                    print(err.localizedDescription)
                    completion(.networkFail)
                    // .networkFail이라는 반환값이 넘어감
                    break
                }
        }
    } // func login
} // struct


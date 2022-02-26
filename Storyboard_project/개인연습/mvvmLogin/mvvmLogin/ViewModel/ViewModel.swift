//
//  ViewModel.swift
//  mvvmLogin
//
//  Created by 이원빈 on 2022/01/27.
//

import Foundation

class ViewModel: NSObject {
    var user: User! //Model
    var userName: String = "name"
    var email: String {return user.email}
    
    typealias authenticationLoginCallback = (_ status: Bool, _ message: String) -> Void //callback
    var callback: authenticationLoginCallback?

    func authenticateUserWith(_ username: String, andPassword password: String) {  //로그인 유효성 검사
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            if username.count != 0{
                if password.count != 0 {
                    self.verifyUser(username, password)
                } else {
                    self.callback?(false, "Password should not be empty")
                }
                
            }else {
                self.callback?(false, "Username should not be empty")
            }
        }
    }
    
    
    
    //    //유저확인
    //    fileprivate func verifyUser(_ email: String, _ password: String) {
    //        if userName == "test" && password == "1234" {
    //            user = User(name: userName, email: "\(userName)@gmail.com")
    //            self.callback?(true, "success")
    //        }else {
    //            self.callback?(false, "Please enter valid source")
    //        }
    //    }
    fileprivate func verifyUser(_ username: String, _ password: String) {
        if username == "test" && password == "1234" {
            user = User(name: userName, email: "\(userName)@gmail.com")
            self.callback?(true, "success")
        }else {
            self.callback?(false, "Please enter valid crenetials")
        }
    }
    
    
    //로그인 완료 시 callback 메소드
    
    func loginCompletion(callBack: @escaping authenticationLoginCallback) {
        self.callback = callBack
    }
    
}

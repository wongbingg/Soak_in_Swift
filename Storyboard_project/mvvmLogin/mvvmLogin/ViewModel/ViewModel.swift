//
//  ViewModel.swift
//  mvvmLogin
//
//  Created by 이원빈 on 2022/01/27.
//

import Foundation

class ViewModel: NSObject {
    var user: User! //Model
    var userName: String {return user.name}
    var email: String {return user.email}
    
    typealias authenticationLoginCallback = (_ status: Bool, _ message: String) -> Void //callback
    var callback: authenticationLoginCallback?
    
    //로그인 유효성 검사
    func authenticationUser(_ email: String, _ password: String) {
            if self.userName.count != 0 {
                if password.count != 0 {
                    self.verifyUser(self.userName, password)
                }else {
                    //self.callback?(false, "password error")
                }
            }else {
                //self.callback?(false, "user error")
            }
        }
    
    //유저확인
    fileprivate func verifyUser(_ email: String, _ password: String) {
        if userName == "test" && password == "1234" {
            user = User(name: userName, email: "\(userName)@gmail.com")
            self.callback?(true, "success")
        }else {
            self.callback?(false, "Please enter valid source")
        }
    }
    
    //로그인 완료 시 callback 메소드
    
    func loginCompletion(callBack: @escaping authenticationLoginCallback) {
        self.callback = callBack
    }

}

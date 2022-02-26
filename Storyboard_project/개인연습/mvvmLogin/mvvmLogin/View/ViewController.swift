//
//  ViewController.swift
//  mvvmLogin
//
//  Created by 이원빈 on 2022/01/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
   
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.messageLabel.isHidden = true
      
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        self.messageLabel.isHidden = true
        guard let userName = self.userNameField.text else {return}
        guard let password = self.passwordField.text else {return}
        viewModel.authenticateUserWith(userName, andPassword: password)
        
        viewModel.loginCompletion { [weak self] status, message in  //callback에 따른 UI변환
            guard let self = self else {return}
            if status {
                self.messageLabel.text = "Logged in with username == \(self.viewModel.userName) and email == \(self.viewModel.email)"
                self.messageLabel.isHidden = false
            }else {
                self.messageLabel.text = message
                self.messageLabel.isHidden = false
            }
        }
       }
//    @objc func loginUser() {
//        self.messageLabel.isHidden = true
//        guard let userName = self.userNameField.text else {return}
//        guard let password = self.passwordField.text else {return}
//        viewModel.authenticationUser(userName, password) //로그인 유효성 검사
//
//        //callback에 따른 UI변환
//        viewModel.loginCompletion { [weak self] status, message in
//            guard let self = self else {return}
//            if status {
//                self.messageLabel.isHidden = false
//                self.messageLabel.text = "login success"
//              
//            } else {
//                self.messageLabel.isHidden = false
//                self.messageLabel.text = message
//         
//            }
//        }
//    }
}


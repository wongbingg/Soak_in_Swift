//
//  ViewController.swift
//  FacebookLoginDemo
//
//  Created by 이원빈 on 2023/01/11.
//

import UIKit
import FacebookLogin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let loginButton = FBLoginButton()
       loginButton.center = view.center
       view.addSubview(loginButton)
    }


}


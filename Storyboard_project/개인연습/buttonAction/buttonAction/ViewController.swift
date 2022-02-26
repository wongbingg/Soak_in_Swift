//
//  ViewController.swift
//  textlav
//
//  Created by 이원빈 on 2022/01/27.
//

//inputText 에 string 을 입력하면 messageLabel 에 나타나게 하기 미션

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var inputText: UITextField!
    
    @IBAction func buttonPress(_ sender: UIButton) {
        cal(inputText.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func cal(_ input:String){
        if input.count != 0{
            self.messageLabel.text = input
        }else {
            print("not done")
        }
    }
}


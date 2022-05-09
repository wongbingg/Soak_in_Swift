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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func stepperButton(_ sender: UIStepper) {
        
        messageLabel.text = String(sender.value)
        
    }
}


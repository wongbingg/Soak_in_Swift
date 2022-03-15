//
//  ViewController.swift
//  BreakPoint
//
//  Created by 이원빈 on 2022/03/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
        
    }
    
    func helloWorld() {
        print("helloWorld")
    }
    override var debugDescription: String {
        return "이 객체의 debugDescription은 \(super.debugDescription) 입니다."
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        print("button is pressed")
    }
    
}


//
//  ViewController.swift
//  XcTest<P>
//
//  Created by 이원빈 on 2022/03/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldExample: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

class Calculator {
    private var number: Int
    
    init(with number: Int) {
        self.number = number
    }
    
    var numberDescription: String {
        return "The number is: \(number)"
    }
    
    func multiply(by otherNumber: Int) {
        number *= otherNumber
    }
    
    func divide(by otherNumber: Int) {
        number /= otherNumber
    }
}

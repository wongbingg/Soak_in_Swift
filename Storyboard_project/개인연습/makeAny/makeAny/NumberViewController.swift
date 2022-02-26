//
//  SecondViewController.swift
//  makeAny
//
//  Created by 이원빈 on 2022/02/11.
//

import UIKit

class NumberViewController: UIViewController {

    var numberLabel: String?
    
    @IBOutlet weak var numLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numLabel.text = numberLabel

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

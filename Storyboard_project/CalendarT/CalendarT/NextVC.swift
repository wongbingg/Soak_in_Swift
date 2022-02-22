//
//  NextVC.swift
//  CalendarT
//
//  Created by 이원빈 on 2022/02/22.
//

import UIKit

class NextVC: UIViewController {

    var mymy: String?
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLabel.text = mymy

        // Do any additional setup after loading the view.
    }
    
    

}

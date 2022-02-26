//
//  NextViewController.swift
//  makeTableView
//
//  Created by 이원빈 on 2022/02/13.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet weak var numLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}

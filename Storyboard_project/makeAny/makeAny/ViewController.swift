//
//  ViewController.swift
//  makeAny
//
//  Created by 이원빈 on 2022/02/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func oneButtonPressed(_ sender: UIButton) {
        
        buttonNameLabel.text = (sender.titleLabel?.text)!
        
        }
    
    @IBAction func twoButtonPressed(_ sender: UIButton) {
        
        buttonNameLabel.text = (sender.titleLabel?.text)!
        
    }
    
    
    @IBAction func threeButtonPressed(_ sender: UIButton) {
        
        buttonNameLabel.text = (sender.titleLabel?.text)!
    }
    
   
    @IBAction func buttonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "gotoNext", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoNext" {
            let destinationVC = segue.destination as! NumberViewController
            destinationVC.numberLabel = buttonNameLabel.text
        }
    }
    
    
    
    
}


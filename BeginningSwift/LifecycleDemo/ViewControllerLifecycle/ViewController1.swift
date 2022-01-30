//
//  ViewController.swift
//  ViewControllerLifecycle
//
//  Created by Angela Yu on 28/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VC1 viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("VC1 viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("VC1 viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("VC1 viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("VC1 viewDidDisappear")
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationVC = segue.destination as! ViewController2
//        destinationVC.label.text = "Hello"
//    }
    

}


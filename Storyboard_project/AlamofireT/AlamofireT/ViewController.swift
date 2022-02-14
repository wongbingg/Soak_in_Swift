//
//  ViewController.swift
//  AlamofireT
//
//  Created by 이원빈 on 2022/02/14.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        AF.request("https://jsonplaceholder.typicode.com/todos/1").response { response in
            debugPrint(response)
        }
            
        }
    }
    
    



//"https://jsonplaceholder.typicode.com/todos/1"



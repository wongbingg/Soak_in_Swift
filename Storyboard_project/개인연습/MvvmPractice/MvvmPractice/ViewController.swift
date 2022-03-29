//
//  ViewController.swift
//  MvvmPractice
//
//  Created by 이원빈 on 2022/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = ViewModel()
    
    @IBOutlet var datetimeLabel: UILabel!
    
    @IBAction func onYesterday(){
        viewModel.moveDay(day: -1)
    }
    
    @IBAction func onNow() {
        viewModel.reload()
    }
    
    @IBAction func onTomorrow() {
        viewModel.moveDay(day: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.datetimeLabel.text = self?.viewModel.dateTimeString
            }
        }
        
        viewModel.reload()
    }

}


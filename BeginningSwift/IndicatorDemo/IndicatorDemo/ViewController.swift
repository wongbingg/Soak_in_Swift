//
//  ViewController.swift
//  IndicatorDemo
//
//  Created by 이원빈 on 2022/07/19.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        // Create an indicator.
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.center = self.view.center
        
        // Also show the indicator even when the animation is stopped.
        activityIndicator.hidesWhenStopped = false
        activityIndicator.style = .large
        activityIndicator.color = .red
        
        // Start animation.
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    
    let someLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "some Label"
        label.textAlignment = .center
        label.textColor = .systemBlue
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(activityIndicator)
        view.addSubview(someLabel)
        someLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        someLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view.subviews.forEach {
            if $0 == activityIndicator {
                $0.removeFromSuperview()
            }
        }
        
    }
}


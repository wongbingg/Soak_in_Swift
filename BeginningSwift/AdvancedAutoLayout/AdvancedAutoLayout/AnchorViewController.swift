//
//  AnchorViewController.swift
//  AdvancedAutoLayout
//
//  Created by 이원빈 on 2022/05/07.
//

import UIKit

class AnchorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        button.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
        button.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10).isActive = true
        let safeBottomAnchor = button.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        safeBottomAnchor.isActive = true
        safeBottomAnchor.priority = .defaultHigh
        
        let viewBottomAnchor = button.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20)
        viewBottomAnchor.isActive = true
        
    }
}

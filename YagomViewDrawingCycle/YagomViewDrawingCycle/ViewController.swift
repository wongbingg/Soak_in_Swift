//
//  ViewController.swift
//  YagomViewDrawingCycle
//
//  Created by 이원빈 on 2022/12/16.
//

import UIKit

final class ViewController: UIViewController {
    private let button: UIButton = {
        let button = UIButton(
            frame: CGRect(
                x: 40,
                y: 40,
                width: 100,
                height: 100
            )
        )
        button.setTitle("이동", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .gray
        return button
    }()
    
    private let customView = CustomView(
        frame: CGRect(
            x: UIScreen.main.bounds.maxX/2,
            y: UIScreen.main.bounds.maxY/2,
            width: 100,
            height: 100
        )
    )
    
//    override func loadView() {
//
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        customView.backgroundColor = .blue
        view.addSubview(customView)
        view.addSubview(button)
        button.addTarget(
            self,
            action: #selector(buttonDidTapped),
            for: .touchUpInside
        )
    }
    
    override func updateViewConstraints() {
        
    }
    
    override func viewWillLayoutSubviews() {
        
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    @objc func buttonDidTapped() {
        customView.frame.origin.x += 5
//        customView.setNeedsDisplay()
        customView.layoutIfNeeded()
    }
}

//
//  DynamicViewController.swift
//  AdvancedAutoLayout
//
//  Created by 이원빈 on 2022/05/08.
//

import UIKit

class DynamicViewController: UIViewController {

    @IBOutlet var stackView: UIStackView!
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(adjustButtonDynamicType),
                                               name: UIContentSizeCategory.didChangeNotification,
                                               object: nil)
        
    }
    
    @objc func adjustButtonDynamicType() {
        buttons.forEach { (button) in
            button.titleLabel?.adjustsFontForContentSizeCategory = true
        }
    }
    
    @IBAction func addView() {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.isHidden = true
        label.text = """
            dfasdfasdf
            asdfasdfasd
            """
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        stackView.addArrangedSubview(label)
        
        UIView.animate(withDuration: 0.3) {
            label.isHidden = false
        }
    }
    
    @IBAction func removeView() {
        guard let last = stackView.arrangedSubviews.last else { return }
        
        UIView.animate(withDuration: 0.3) {
            last.isHidden = true
        } completion: { _ in
            self.stackView.removeArrangedSubview(last)
        }
    }


}

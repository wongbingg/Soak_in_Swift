//
//  ViewController.swift
//  AutoScrollByKeyboardDemo
//
//  Created by 이원빈 on 2022/07/29.
//

import UIKit

class ViewController: UIViewController ,UITextViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var textView: UITextView!
    var keyHeight: CGFloat?
    @IBOutlet weak var fakeView: UIView!
    
    @IBAction func buttonDidTapped(_ sender: UIButton) {
        textView.resignFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = "ㅅㄷㄴㄴ"
        label1.text = "실험용인 레이블 입니다 줄바꿈을 위해 조금 많이 써보겠습니다"
        label2.text = "실험용인 레이블 입니다 줄바꿈을 위해 조금 많이 써보겠습니다"
        textView.delegate = self
        fakeView.heightAnchor.constraint(equalToConstant: 270).isActive = true
        fakeView.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        print("keyboard up")
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            scrollView.contentOffset.y += keyboardHeight
            print(keyboardHeight)
        }
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        print("keyboard down")
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            scrollView.contentOffset.y -= keyboardHeight
        }
    }
    
    @objc func goToBottom() { // contentOffSet 으로 현재 스크롤된 origin.y 위치를 구할 수 있다. 즉, 현재 스크롤 뷰의 y 위치를 구할 수 있다.
//        guard let scrollView = productSetupView?.mainScrollView else { return }
//        scrollView.scrollRectToVisible(CGRect(x: 0,
//                                              y: scrollView.contentSize.height -
//                                              scrollView.bounds.height,
//                                              width: scrollView.bounds.size.width,
//                                              height: scrollView.bounds.size.height),
//                                       animated: true)
        scrollView.scrollRectToVisible(CGRect(x: 0, y: 1849, width: 1, height: 1), animated: true)
        print("현재 contentSize height: \(scrollView.contentSize.height)")
        print("contentOffSet: \(scrollView.contentOffset.y)")
        print("현재 뷰 높이: \(scrollView.frame.height)")
    }
    
}


//
//  ViewController.swift
//  PickerViewDemo
//
//  Created by 이원빈 on 2022/07/27.
//

import UIKit

class ViewController: UIViewController {
    
    let imagePicker = UIImagePickerController()
    var mainView: ProductDetailView?
    lazy var imageList: [UIImageView?] = [mainView?.testImage1, mainView?.testImage2, mainView?.testImage3, mainView?.testImage4, mainView?.testImage5]
    
    var imageNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        mainView = ProductDetailView(self)
        self.navigationItem.title = "상품등록"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonDidTapped))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonDidTapped))
        
        
        self.imagePicker.sourceType = .photoLibrary // 앨범에서 가져옴
        self.imagePicker.allowsEditing = true // 수정 가능 여부
        self.imagePicker.delegate = self // picker delegate
        
        mainView?.testImage6.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        
    }
    
    @objc func pickImage(){
        if imageNum == 5 {
            showAlert(title: "알림", message: "게시할 수 있는 사진의 최대 갯수 5개 입니다")
            return
        }
        self.present(self.imagePicker, animated: true)
    }
    
    
    @objc func cancelButtonDidTapped(){
        print("cancel")
    }
    @objc func doneButtonDidTapped(){
        print("Done")
    }
    
    func showAlert(title: String, message: String) {
        let failureAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        failureAlert.addAction(UIAlertAction(title: "확인", style: .default))
        present(failureAlert, animated: true)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var newImage: UIImage? = nil // update 할 이미지
        
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage // 수정된 이미지가 있을 경우
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage // 원본 이미지가 있을 경우
        }
        imageList[imageNum]?.isHidden = false
        imageList[imageNum]?.image = newImage
        imageNum += 1         // 받아온 이미지를 update
        picker.dismiss(animated: true, completion: nil) // picker를 닫아줌
    }
    
    
}

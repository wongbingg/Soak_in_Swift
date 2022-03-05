//
//  ViewController.swift
//  KingfisherT
//
//  Created by 이원빈 on 2022/03/05.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var imageOne: UIImageView!
    
    @IBOutlet weak var imageTwo: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getImage()
    }
    
    
    func getImage() {
        let url = URL(string:"https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%91%E1%85%B5%E1%84%8F%E1%85%A1%E1%84%8E%E1%85%B2.png?alt=media&token=68c2ffff-81a5-4db9-a67e-b776242cea02")
        let url1 = URL(string: "https://picsum.photos/1280/720/?random")
        imageOne.kf.setImage(with:url)
        imageTwo.kf.setImage(with:url1)
    }

}


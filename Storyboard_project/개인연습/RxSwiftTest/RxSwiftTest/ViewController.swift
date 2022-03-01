//
//  ViewController.swift
//  RxSwiftTest
//
//  Created by 이원빈 on 2022/03/01.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        Observable.just("800x600")
            .map{ $0.replacingOccurrences(of: "x", with: "/")}
            .map{ "https://picsum.photos/\($0)/?random" }
            .map{ URL(string: $0)}
            .filter{ $0 != nil}
            .map {$0!}
            .map{ try Data(contentsOf: $0)}
            .map { UIImage(data: $0)}
            .subscribe(onNext: {image in
                self.imageView.image = image
            })
            .disposed(by: disposeBag)
        Observable.just("Hello World")
            .subscribe{ event in
                switch event {
                case .next(let str):
                    break
                case .error(let err):
                    break
                case .completed:
                    break
                }
            }
            .disposed(by: disposeBag)
        
        
    }


}


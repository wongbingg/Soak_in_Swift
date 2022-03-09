//
//  ViewController.swift
//  RxSwiftT
//
//  Created by 이원빈 on 2022/03/06.
//

import UIKit
import RxSwift
import Pods_RxSwiftT


class ViewController: UITableViewController {

    @IBOutlet weak var imageView: UIImageView!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressButton(_ sender: UIButton) {
        
        Observable.just("800x600")
            .map {$0.replacingOccurrences(of: "x", with: "/")}
            .map{ "https://picsum.photos/\($0)/?random"}
            .map{ URL(string: $0)}
            .filter { $0 != nil}
            .map{try Data(contentsOf: $0!)}
            .map{UIImage(data: $0)}
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .default))
            .observe(on: MainScheduler.instance)
            .do(onNext: { image in
                print(image?.size ?? "default value")
            })
            .subscribe(onNext: {image in
                self.imageView.image = image
            })
            .disposed(by: disposeBag)
}
    

}


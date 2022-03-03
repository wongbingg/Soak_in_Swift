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
      
        /*Observable.just("800x600")
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
            .disposed(by: disposeBag) //사진불러오기
        //MARK: - Observable(sequence)생성
        example(of: "just, of, from") {
            
            let one = 1
            let two = 2
            let three = 3
            
            let observable = Observable<Int>.just(one)
            let observable2_1 = Observable.of(one,two,three)
            let observable3_1 = Observable.of([one,two,three])
            let observable3_2 = Observable.just([one,two,three])
            let observable4 = Observable.from([one,two,three])
            
        }
        
        example(of:"create") {
            let disposeBag = DisposeBag()
            let observable = Observable<String>.create({ (observer) -> Disposable in //클로져 형식이며 다양한 값(onNext,onComplete..)생성가능
                
                observer.onNext("1")
                
                observer.onCompleted()
                
                observer.onNext("?")
                
                return Disposables.create()
            })
            
            observable.subscribe{(event) in // 구독
                print(event)
            }
        }
        //MARK: - Observable Subscribing
        example(of: "subscribe") {
            let one = 1
            let two = 2
            let three = 3
            
            let observable = Observable.of(one,two,three)
            observable.subscribe { event in // 옵저버에 담긴 이벤트들을 방출(emit)하는 것
                print(event)
            }
            
            observable.subscribe(onNext: {element in //next 요소만 처리한다! 그래서 위와 달리 complete출력 x
                print(element)
            })
        }
        
        example(of: "empty") {
            let observable = Observable<Void>.empty()
            
            observable.subscribe(
            
                onNext: {(element) in
                    print(element)
                },
                onCompleted: {
                    print("Completed")
                }
            )
        }
        
        example(of: "never") {
            let observable = Observable<Any>.never()
            
            observable
                .subscribe(
                    onNext: {(element) in
                        print(element)
                    },
                    onCompleted:{
                        print("completed")
                    }
                )
        }
        
        example(of: "range") {
            let observable = Observable<Int>.range(start: 1, count: 10)
            
            observable
                .subscribe(onNext: {(i) in
                    
                    let n = Double(i)
                    let fibonacci = Int(((pow(1.61803,n)-pow(0.61803,n)) / 2.23606).rounded())
                    print(fibonacci)
                }
            )
        }
        
        
        //MARK: - Disposing
        example(of: "dispose") {
            let observable = Observable.of("A","B","C")
            let subscription = observable.subscribe( {event in
                print(event)
            })
            subscription.dispose()
        }
        
        example(of: "DisposeBag") {
            let disposeBag = DisposeBag()
            
            Observable.of("A","B","C")
                .subscribe{
                    print($0)
                }
                .disposed(by: disposeBag)
            print(disposeBag)
        }
        
        enum MyError: Error {
            case anError
        }
        example(of: "create") {
            let disposeBag = DisposeBag()
            
            Observable<String>.create({ (observer) -> Disposable in
                observer.onNext("1")
                
                observer.onError(MyError.anError)
                
                observer.onCompleted()
                
                observer.onNext("?")
                
                return Disposables.create()
            })
                .subscribe(
                    onNext: {print($0)},
                    onError: {print($0)},
                    onCompleted: {print("Completed")},
                    onDisposed: {print("Disposed")}
                ).disposed(by: disposeBag)  // 이 구문이 있는 이유: 메모리 제거함으로써 메모리 효율 확보
        }
        
        example(of: "deferred") {
            let disposeBag = DisposeBag()
            
            var flip = false
            
            let factory: Observable<Int> = Observable.deferred() {
                
                flip = !flip
                
                if flip {
                    return Observable.of(1,2,3)
                } else {
                    return Observable.of(4,5,6)
                }
            }
            
            for _ in 0...3 {
                factory.subscribe(onNext: {
                    print($0, terminator: "")
                })
                    .disposed(by: disposeBag)
                
                print()
            }
        }
        
        //MARK: - Traits
        example(of: "Single") {
            let disposeBag = DisposeBag()
            
            enum FileReadError: Error {
                case fileNotFound, unreadable, encodingFailed
            }
            
            func loadText(from name: String) -> Single<String> {
                return Single.create{ single in
                    let disposable = Disposable.create()
                    guard let path = Bundle.main.path(forResource: name, ofType: "txt") else {
                        single(.error(FileReadError.fileNotFound))
                        return disposable
                    }
                    
                    guard let data = FileManager.default.contents(atPath: path) else {
                        single(.error(FileReadError.unreadable))
                        return disposable
                    }
                    
                    guard let contents = String(data: data, encoding: .utf8) else {
                        single(.error(FileReadError.encodingFailed))
                        return disposable
                    }
                    
                    single(.success(contents))
                    return disposable
                }
            }
        }

    }
    
    
    public func example(of description: String,
                        action: () -> Void) {
        print("\n--- Example of:", description, "---")
        action()
    }*/

}


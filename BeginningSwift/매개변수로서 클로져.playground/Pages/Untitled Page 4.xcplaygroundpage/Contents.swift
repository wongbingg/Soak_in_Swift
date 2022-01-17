import UIKit

func sayHiOptional(completion: (() -> Void)? = nil){
    print("sayHiOptional() called")
    sleep(2)
    completion?()//completion 클로져 실행
}

sayHiOptional()

sayHiOptional(completion: {
    print("2초가 지났다.!!")
})

sayHiOptional{
    print("2초가 지났다.!!")
}

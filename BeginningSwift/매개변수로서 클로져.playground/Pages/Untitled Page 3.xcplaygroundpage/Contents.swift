// 매개변수로서 데이터를 여러개 반환하는 클로저

import UIKit

func sayHiWithFullName(completion: (String,String) -> Void){
    print("sayHiWithName() called")
    sleep(2)
    completion("빡코딩","호논논")//클로저를 실행과 동시에 데이터를 반환
}
sayHiWithFullName{ _, second in
    print("두번째: \(second)")
}

sayHiWithFullName{
    print("첫번째: \($0), 두번째: \($1)")
}







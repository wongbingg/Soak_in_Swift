// 매개변수로서 데이터를 반환하는 클로져

import UIKit

func completion(){

}
func sayHiWithName(completion: (String) -> Void){
    print("sayHiWithName() called")
    sleep(2)
    completion("오늘도 빡코딩 하고 계신가요?!")//클로저를 실행과 동시에 데이터를 반환

}

sayHiWithName(completion: { (comment: String) in
    print("2초 뒤에 그가 말했다! comment: ",comment)
})

sayHiWithName(completion: { comment in
    print("2초 뒤에 그가 말했다! comment: ",comment)
})

sayHiWithName{ comment in
    print("2초 뒤에 그가 말했다! comment: ",comment)
}

sayHiWithName{
    print("2초 뒤에 그가 말했다! comment: ",$0)
}

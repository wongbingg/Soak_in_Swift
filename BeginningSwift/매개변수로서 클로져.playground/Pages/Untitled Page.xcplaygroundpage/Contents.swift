import UIKit

func completion(){

}

//completion 이라는 클로져를 매개변수로 가지는
func sayHi(completion: () -> Void){
    print("sayHi() called")
    sleep(2) //2초 멈추기
    completion()//completion 클로져 실행
}

//메소드 호출부 에서 이벤트 종료를 알 수 있다.
sayHi(completion: {
    print("2초가 지났다.")
})

sayHi(){
    print("2초가 지났다. 2")
}

sayHi{
    print("2초가 지났다. 3")
}



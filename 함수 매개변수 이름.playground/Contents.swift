import UIKit

//함수, 메소드 정의
func myFunction(name: String) -> String{
    return "안녕하세요?! \(name) 입니다!"
}

//함수, 메소드를 호출한다. call
myFunction(name: "쩡대리")
//매개변수 이름 with
func myFunctionSecond(with name: String) -> String{
    return "안녕하세요?! \(name) 입니다!"
}
myFunctionSecond(with: "이원빈")
//매개변수 이름 필요 x
func myFunctionthird(_ name: String) -> String{
    return "안녕하세요?! \(name) 입니다!"
}
myFunctionthird("이원빈")

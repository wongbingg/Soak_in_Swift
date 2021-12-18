//var implicitlyUnwrappedOptionalValue: Int! = 100
//
//switch implicitlyUnwrappedOptionalValue {
//case .none:
//    print("This Optional variable is nil")
//case .some(let value):
//    print("Value is \(value)")
//}
//
////기존 변수처럼 사용 가능
//implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1
//
////nil 할당가능
//implicitlyUnwrappedOptionalValue = nil
//
//var optionalValue: Int? = 100
//
//switch optionalValue {
//case .none:
//    print("This Optional variable is nil")
//case .some(let value):
//    print("Value is \(value)")
//}

//기존 변수처럼 사용불가 - 옵셔널과 일반 값은 다른 타입이므로 연산 불가
//optionalValue = optionalValue + 1
//optionalValue = nil

func printName(_ name: String){
    print(name)
}

var myName: String? = nil

//printName(myName) //전달되는 값의 타입이 옵셔널이고 원래는 스트링이 들어와야됨 그래서 오류

if let name: String = myName {
    printName(name)
}else {
    print("myName == nil")
}
var yourName: String! = nil

if let name: String = yourName {
    printName(name)
}else {
    print("yourName == nil")
}

//myName = "wongbing"
//yourName = nil

if let name = myName, let friend = yourName {
    print("\(name) and \(friend)")
} //yourName이 nil이기 때문에 실행 x

//yourName = "hana"

if let name = myName, let friend = yourName {
    print("\(name) and \(friend)")
} // myName 과 yourName 둘다 값이 있기 때문에 출력

//강제추출: 옵셔널에 값이 들어있는지 아닌지 확인하지 않고 강제로 값을 꺼내는 방식.
var myName: String? = "wongbing"
var yourName: String! = nil

printName(myName)
myName = nil

print(myName)

yourName = nil
print(yourName)

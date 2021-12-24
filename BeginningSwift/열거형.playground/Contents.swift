//enum Weekday {
//    case mon
//    case tue
//    case wed
//    case thu, fri, sat, sun
//}
//
////열거형 타입과 케이스를 모두 사용하여도 됨
//var day: Weekday = Weekday.mon
////타입이 명확하다면 .케이스 처럼 표현해도 무방
//day = .tue
//
////switch의 비교값에 열거형 타입이 위치할 때
////모든 열거형 케이스를 포함한다면 default 필요x
//switch day {
//case .mon, .tue, .wed, .thu:
//    print("평일입니다")
//case Weekday.fri:
//    print("불금파티!")
//case .sat, .sun:
//    print("신나는 주말!")
//}

//enum Fruit: Int {
//    case apple = 0
//    case grape = 1
//    case peach
//    case banana
//    case kiwi
//    case water
//}

//print(Fruit.peach.rawValue)

//enum School: String {
//    case elementary = "초등"
//    case middle = "중등"
//    case high = "고등"
//    case university //원시값이 적용되지 않았을 때는 case의 이름으로 원시값 사용
//}
//
//print("School.middle.rawValue == \(School.middle.rawValue)")
//print("School.university.rawValue == \(School.university.rawValue)")//원시값 사용 예

///////////////원시값을 통한 초기화////////////rawValue를 통해 초기화 한 인스턴스는 옵셔널 타입이다///////
//let who: Fruit? = Fruit(rawValue: 0)
//
////if let 구문을 사용하면 rawValue에 해당하는 케이스 곧바로 사용 가능
//if let what: Fruit = Fruit(rawValue: 4){
//    print("rawValue 5에 해당하는 케이스는 \(what) 입니다")
//}else {
//    print("rawValue 5에 해당하는 케이스가 없습니다")
//}

///열거형에 메서드를 추가해서 사용하기///
//enum Month {
//    case dec, jan, feb
//    case mar, apr, may
//    case jun, jul, aug
//    case sep, oct, nov
//
//    func printMessage() {
//        switch self {
//        case .mar, .apr, .may:
//            print("봄")
//        case .jun, .jul, .aug:
//            print("여름")
//        case .sep, .oct, .nov:
//            print("가을")
//        case .dec, .jan, .feb:
//            print("겨울")
//        }
//    }
//}
//var weather:Month = Month.may
//weather.printMessage()

//값타입(enum,struct) 와 참조타입(class) 비교

struct ValueType {
    var property = 1
}
class ReferenceType {
    var property = 1
}
let firstStructInstance = ValueType()
var secondStructInstance = firstStructInstance
secondStructInstance.property = 2

print("first struct instance property : \(firstStructInstance.property)")
print("second struct instance property : \(secondStructInstance.property)")

let firstClassReference = ReferenceType()
let secondClassReference = firstClassReference
secondClassReference.property = 2

print("first class reference property : \(firstClassReference.property)")
print("second class reference property : \(secondClassReference.property)")
    
//스위프트의 기본데이터 타입은 구조체 and 구조체와 열거형을 선호함


class Sample {
    
    var mutableProperty: Int = 100
    let immutableProperty: Int = 100
    static var typeProperty: Int = 100

    func instanceMethod() {
        print("instance method")
    }
    static func typeMethod() {
        print("type method - static")
    }
    class func classMethod() {
        print("type method - class")
    }
}
//클래스의 인스턴스는 참조 타입이므로 let으로 선언되었더라도 인스턴스 프로퍼티 값 변경이 가능하다

var mutableReference: Sample = Sample()
mutableReference.mutableProperty = 200
mutableReference.immutableProperty = 200

let immutableReference: Sample = Sample()
immutableReference.mutableProperty = 100
immutableReference.immutableProperty = 100

//타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod()


//인스턴스에서는 타입 프로퍼티나 타입 메서드를 사용할 수 없다.
mutableReference.typeProperty = 499
mutableReference.typeMethod()

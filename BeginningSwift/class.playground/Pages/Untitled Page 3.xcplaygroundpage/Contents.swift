
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
//오버라이딩이 가능한 "연산 타입 프로퍼티"
class Wong: Sample {
    override class func classMethod() {
        print("override test")
    }
}
Sample.classMethod()
Wong.classMethod()

//오버라이딩이 불가능한 "연산 타입 프로퍼티"
class Wongb: Sample {
    override static var typeProperty: Int = 200
}

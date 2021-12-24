struct Sample {
    //가변 프로퍼티
    var mutableProperty: Int = 100
    //불변 프로퍼티
    let immutableProperty: Int = 100
    //타입 프로퍼티(static 키워드 사용 : 타입 자체가 사용하는 프로퍼티)
    static var typeProperty: Int = 100

    //인스턴스 메서드(인스턴스가 사용하는 메서드)
    func instanceMethod() {
        print("instance method")
    }
    //타입 메서드(static 키워드 사용 : 타입 자체가 사용하는 메서드)
    static func typeMethod() {
        print("type method")
    }
}
//<->클래스의 경우 인스턴스는 참조 타입이므로 let선언 가능
var mutable: Sample = Sample()
mutable.mutableProperty = 200
mutable.immutableProperty = 200

let immutable: Sample = Sample()
immutable.mutableProperty = 200
immutable.immutableProperty = 200

//타입 프로퍼티 및 메서드
Sample.typeProperty = 400
Sample.typeMethod()

//인스턴스에서는 타입 프로퍼티나 타입 메서드를 사용할 수 없다.
mutable.typeProperty = 400
mutable.typeMethod()

struct Student {
    var name: String = "unknown"
    //키워드도 '으로 묶어주면 이름으로 사용 가능
    var classs: String = "Swift"
    
    static func selfIntroduce() {
        print("학생타입입니다")
    }
    static func selftalk() {
        print("Struct 함수 연습중...")
    }
    func selfIntroduce() {
        //self는 인스턴스 자신을 지칭, 몇몇 경우를 제외하고 사용은 선택사항
        print("저는 \(self.classs)반 \(name)입니다")
    }
}

Student.selfIntroduce()
Student.selftalk()

var wongbing: Student = Student()
wongbing.name = "wongbing"
wongbing.classs = "스위프트"
wongbing.selfIntroduce()

let jina: Student = Student()
//jina.name = "jina"
jina.selfIntroduce()

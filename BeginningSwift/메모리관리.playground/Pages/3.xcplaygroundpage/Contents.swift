// 강한참조 보다 약한참조를 통해 메모리 누수를 피한다

class TestClass {
    weak var testClass: TestClass? = nil
    init() {
        print("init")
    }
    deinit {
        print("deinit")
    }
}

var testClass1 :TestClass? = TestClass()
var testClass2 :TestClass? = TestClass()

testClass1?.testClass = testClass2
testClass2?.testClass = testClass1

testClass1 = nil
testClass2 = nil

// deinit이 프린트가 됐다면 메모리 해제가 잘 된것이다

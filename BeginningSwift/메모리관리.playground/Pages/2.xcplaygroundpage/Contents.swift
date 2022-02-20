
class TestClass {
    var testClass: TestClass? = nil
    init() {
        print("init")
    }
    deinit {
        print("deinit")
    }
}
var testClass1: TestClass? = TestClass()
var testClass2: TestClass? = TestClass()

testClass1?.testClass = testClass2
testClass2?.testClass = testClass1

testClass1 = nil //강한 참조를 잃었다 but 내부에 하나 더 남아있어 메모리 해제 x
testClass2 = nil

//memory leak 메모리누수


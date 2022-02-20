
class TestClass {
    init() {
        print("init")
    }
    deinit {
        print("deinit")
    }
}
var testClass: TestClass? = TestClass() //강한참조
testClass = nil //강한참조 사라지고 TestClass 객체는 메모리에서 사라짐

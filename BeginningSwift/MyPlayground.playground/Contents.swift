
class TestClass {
    init() {
        print("init")
    }
    deinit {
        print("deinit")
    }
}
var testClass: TestClass? = TestClass()
testClass = nil

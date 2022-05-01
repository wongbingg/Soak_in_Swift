//MARK: - 저장 프로퍼티에 property observer 이용할 때

// value 값이 변경될 때 마다 count 해주는 observer 설정
struct TrackedString {
    var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

var object = TrackedString()
object.value = "hi" // value값 변경
print(object.numberOfEdits) // 1 출력 <getter>
object.numberOfEdits = 5 // 갑자기 numberOfEdits이 5가 되버렸다 <setter>
object.value = "hi hi" // value값 변경
print(object.numberOfEdits) // 원래는 2가 나와야 되지만 중간에 5의 방해로 6을 출력 <getter>
// 변경되지 말아야될 값이 변경이 되어 불편함이 생길 수 있다 !!
// setter가 private이 안되있어서 생긴 문제!
// setter만 따로 private하게 만들어줄 수 있을까?

//MARK: - 해결방안 private(set) 이용
//struct TrackedString {
//    private(set) var numberOfEdits = 0
//    var value: String = "" {
//        didSet {
//            numberOfEdits += 1
//        }
//    }
//    public init() {}
//}
//
//var object = TrackedString()
//object.value = "hi"
//print(object.numberOfEdits)
//object.numberOfEdits = 3
//object.value = "hi hi"
//print(object.numberOfEdits)


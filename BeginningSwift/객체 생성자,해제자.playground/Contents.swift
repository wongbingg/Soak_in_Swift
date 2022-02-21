import UIKit

class MyFriend {
    var name : String
    init(_ name: String = "이름없음"){
        self.name = name
        print("MyFriend 가 메모리에 올라갔다.")
    }
    deinit{
        print("메모리에서 사라짐.")
    }
}

let myFriend = MyFriend("쩡대리")
let aFriend = MyFriend()

let anObjectMemoryAddress = Unmanaged.passUnretained(aFriend).toOpaque()

let secondMemorryAddress = Unmanaged.passUnretained(myFriend).toOpaque()

print(anObjectMemoryAddress)
print(secondMemorryAddress)




import UIKit
import Foundation


//enum Emotion { case happy, sad, angry}
//enum Species { case human, bear, dragon}
//
//var cachedEmoji = [Attributes: UIImage]()
//
//func generateEmoji(_ emotion: Emotion, _ species: Species) -> UIImage {
//    let key = Attributes(emotion: emotion, species: species)
//    if let image = cachedEmoji[key] {
//        return image
//    }
//    return image
//}
//
//struct Attributes: Hashable {
//    var emotion: Emotion
//    var species: Species
//}
//
//// Hashable 은 사용자 정의 타입을 컬렉션에 사용하기 위해 필요한 프로토콜
////////////////////////////////////////////////////////////////////////////////////////////////
//var array1: [Int] = [1,2,3,4,5,6,7,8,9,10]
//print(UnsafeRawPointer(array1))
//
//var array2 = array1
//print(UnsafeRawPointer(array2)) //복사되지 않고 참조됨
//
//array2.removeLast() //수정이 발생하므로 참조를 끊고 다른 메모리 공간을 할당!
//print(array1)
//print(UnsafeRawPointer(array1))
//print(array2)
//print(UnsafeRawPointer(array2))

//////////////////////////////////////////////////////////////////////////////////////////////////
//struct User {
//    var name: String
//    var age: Int
//}
//
//class DataWrapper<T> {
//    var data: T
//    init(data: T) {
//        self.data = data
//    }
//}
//
//struct COWUser<T> {
//    private var dataWrapper: DataWrapper<T>
//    init(data: T) {
//        self.dataWrapper = DataWrapper(data: data)
//    }
//
//    var data: T {
//        get {
//            return self.dataWrapper.data
//        }
//        set {
//            guard isKnownUniquelyReferenced(&dataWrapper) else {
//                dataWrapper = DataWrapper(data: newValue)
//                return
//            }
//            dataWrapper.data = newValue
//        }
//    }
//}
//
//let user = User(name: "user1", age: 25)
//var cowUser1 = COWUser(data: user)
//debugPrint(cowUser1)
//var cowUser2 = cowUser1 // 메모리주소 동일 -> 참조로 넘겨주었다?
//cowUser2.data.age = 22 // 수정발생! -> setter에 따라, dataWrapper 참조가 유일하지 않으므로 새로운 DataWrapper인스턴스를 생성하여 할당.
/////////////////////////////////// 값 타입 안의 참조타입 //////////////////////////////////////////////////////////////

//class HighSchool: CustomStringConvertible {
//    var description: String {
//        return "\(name) High School"
//    }
//
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//struct Student {
//    var highSchool: HighSchool
//}
//
//let swiftHighSchool = HighSchool(name: "Swift")
//
//let student1 = Student(highSchool: swiftHighSchool)
//let student2 = Student(highSchool: swiftHighSchool)
//
//student2.highSchool.name = "Next"
//
//print(student1.highSchool)
//print(student2.highSchool)

/////////////////////////////// 참조타입 안의 값타입 //////////////////////////////////////////////////////////////

struct Company {
    var name: String
}

class Product {
    var name: String
    var company: Company
    
    init(name: String, company: Company) {
        self.name = name
        self.company = company
    }
}

let apple = Company(name: "Apple") //struct

let iPhone = Product(name: "iPhone12" , company: apple) //class
let macbookAir = Product(name: "Macbook Air", company: apple) //class

macbookAir.company.name = "Microsoft" //struct로 접근 한거같음

print(iPhone.company.name)
print(macbookAir.company.name)


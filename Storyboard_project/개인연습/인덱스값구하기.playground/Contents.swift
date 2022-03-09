import UIKit

let list:[String] = ["a","b","c","d","e"]

var text = "c"

list.firstIndex(of: text)
//import Foundation
//
//class Person {
//    var name: String
//    var home: Apartment?
//    init(name: String) {
//        self.name = name
//    }
//}
//
//class Apartment {
//    var buildingNumber: String
//    var roomNumber: String
//    var `guard`: Person?
//    var owner: Person?
//    init(dong: String, ho: String) {
//        buildingNumber = dong
//        roomNumber = ho
//    }
//}
//
//let yagom:Person? = Person(name: "yagom")
//let guardName: String? = yagom?.home?.`guard`?.name
//
//let apart: Apartment = Apartment(dong: "101", ho: "202")
//let superman: Person = Person(name:"superman")
//
//yagom?.home = apart
//yagom?.home?.buildingNumber
//yagom?.home?.`guard` = superman
//yagom?.home?.`guard`?.name = "슈퍼맨"
//
//
//
//let name = guardName ?? "경비원"
//print(name)

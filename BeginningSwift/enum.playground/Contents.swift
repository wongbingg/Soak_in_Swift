import UIKit

enum School {
//    case elementary
//    case middle
//    case high
    case elementary, middle, high
}


let yourSchool = School.middle
print("yourSchool: ",yourSchool)

enum Grade : Int {
    case first = 1
    case second = 2
}

let yourGrade = Grade.second.rawValue //.rawValue 가 없으면 2가 출력이 안되네..?
print("yourGrade: \(yourGrade)")

enum SchoolDetail {
    case elementary(name: String)
    case middle(name: String)
    case high(name: String)
    
    func getName() -> String{
        switch self {
        case.elementary(let name):
            return name
        case let .middle(name):
            return name
        case .high(let name):
            return name
        }
    }
}

let yourMiddleSchoolName = SchoolDetail.middle(name:"정대리중학교")
print("yourMiddleSchoolName: \(yourMiddleSchoolName.getName())")


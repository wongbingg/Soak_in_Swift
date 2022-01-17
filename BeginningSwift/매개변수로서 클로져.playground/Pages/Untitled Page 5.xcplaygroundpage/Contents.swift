// (int) -> String

import UIKit

func transform(number:Int) -> String {
    return "숫자 : \(number)"
}

var myNumbers : [Int]=[0,1,2,3,4,5]

var transformedNumbers = myNumbers.map { (aNumber: Int) -> String in
    return "숫자: \(aNumber)"
}
//var transformedNumbers = myNumbers.map { aNumber in
//    return "숫자: \(aNumber)"
//}
//var transformedNumbers = myNumbers.map {
//    return "숫자 : \($0)"
//}



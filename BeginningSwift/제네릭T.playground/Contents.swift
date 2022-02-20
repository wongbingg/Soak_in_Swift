import Foundation

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let tempA = a
    a = b
    b = tempA
}

var someInt = 1
var anotherInt = 2
swapTwoValues(&someInt, &anotherInt)
print(someInt,anotherInt)

var someString = "Hi"
var anotherString = "Bye"
swapTwoValues(&someString, &anotherInt)

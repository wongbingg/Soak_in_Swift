import UIKit
//배열
//콜렉션 - 데이터를 모아둔 것
//배열,셋,딕셔너리,튜플
var myArray: [Int] = [0,1,2,3,4,5,6,7,8,9,10]

//for item in myArray {
//    print("item: \(item)")
//}
//
//for item in myArray where item > 5 {
//    print("5보다 큰수: \(item)")
//}
//
for item in myArray where item % 2 != 0 {
    print("홀수: \(item)")
}

//for item in myArray where item % 2 ==0{
//    print("홀수: \(item)")
//}

/*
 <2805> 나무자르기
 절단기의 높이가 H 로 정해진다 .
 나무의 높이는 제각각 이다.
 적어도 M미터를 가져가기 위해서 절단기에 설정할 수 있는 높이 H의 최댓값
 첫째줄 : 나무의 갯수 N 와 원하는 길이 M 이 주어진다
 둘째줄 : 나무 각각의 높이
 
 N(1 ~ 1,000,000) M(1 ~ 2,000,000,000)
 
 N 만큼의 오차가 생기겠다 왜냐하면 자르는 단위가 1씩이니 N개의 나무를 1씩 자른다고 생각하면 최대오차 N이 난다
 */

//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let N = input[0]
//let M = input[1]
//let lengthOfTrees = readLine()!.split(separator: " ").map { Int($0)! }
//
//func getTree(with height: Int) -> Int {
//    var sum = 0
//    lengthOfTrees.forEach { length in
//        if length > height {
//            sum += length - height
//        }
//    }
//    return sum
//}
//
//var min = 0
//var max = lengthOfTrees.max()!
//var middle = 0
//
//while min < max {
//    middle = (min + max) / 2
//    if getTree(with: middle) >= M && getTree(with: middle + 1) < M {
//        print(middle)
//        break
//    } else if getTree(with: middle) > M && getTree(with: middle + 1) > M {
//        min = middle + 1
//    } else {
//        max = middle - 1
//    }
//}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]
let lengthOfTrees = readLine()!.split(separator: " ").map { Int($0)! }

var min = 0
var max = lengthOfTrees.max()!
var mid = 0

func getTree(with height: Int) -> Int {
    return lengthOfTrees.map { $0 - height }.filter { $0 > 0 }.reduce(0, +)
}
while min < max {
    mid = (min + max) / 2
    if getTree(with: mid) >= M && getTree(with: mid + 1) < M {
        print(mid)
        break
    } else if getTree(with: mid) < M {
        max = mid + 1
    }
    else {
        min = mid - 1
    }
}




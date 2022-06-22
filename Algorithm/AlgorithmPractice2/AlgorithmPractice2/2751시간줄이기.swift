/*
<2751> 수 정렬하기 2
 N개의 수가 주어졌을 때, 이를 오름차순으로 정렬하는 프로그램을 작성하시오.
 N(1~1,000,000)
 
 그냥 sorted 쓰면 시간이 오래걸리지만 되긴 한다 .. 
*/

let N = Int(readLine()!)!
var list: [Int] = []
var isContainNegative: Bool = false
(1...N).forEach { _ in
    let element = Int(readLine()!)!
    if element < 0 {
        isContainNegative = true
    }
    list.append(element)
}
let max = list.max()!
let min = list.min()!
var zeroList: [Int]
if isContainNegative {
    zeroList = Array<Int>(repeating: 0, count: (max + 1) - min)
} else {
    zeroList = Array<Int>(repeating: 0, count: (max + 1))
}

list.forEach { num in
    if isContainNegative {
        zeroList[num - min] = num
    } else {
        zeroList[num] = num
    }
}

zeroList.forEach {
    if $0 != 0 {
        print($0)
    }
}

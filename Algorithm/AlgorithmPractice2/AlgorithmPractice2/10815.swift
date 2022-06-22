/*
 <10815> 숫자카드
 숫자카드는 정수 하나가 적혀져 있는 카드이다. 상근이는 숫자카드 N개를 가지고있다.
 정수 M개가 주어졌을 때, 이 수가 적혀있는 숫자 카드를 상근이가 가지고 있는지 아닌지 구하는 문제
 */
var orderedList: [Int] = []
var resultList: [Int] = []
let n = Int(readLine()!)!
let nList = readLine()!.split(separator: " ").compactMap { Int($0) }
orderedList = nList.sorted()

let m = Int(readLine()!)!
let mlist = readLine()!.split(separator: " ").compactMap { Int($0) }


mlist.forEach { num in
    var min = 0
    var max = n - 1
    var mid = 0
    while min <= max {
        mid = (min + max) / 2
        if orderedList[mid] == num {
            resultList.append(1)
            break
        } else if orderedList[mid] < num {
            min = mid + 1
        } else {
            max = mid - 1
        }
    }
    if min > max {
        resultList.append(0)
    }
}
resultList.forEach { print($0) }

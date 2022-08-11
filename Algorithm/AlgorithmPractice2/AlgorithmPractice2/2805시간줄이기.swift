/*
 <2805> 나무자르기
 절단기의 높이가 H 로 정해진다 .
 나무의 높이는 제각각 이다.
 적어도 M미터를 가져가기 위해서 절단기에 설정할 수 있는 높이 H의 최댓값
 첫째줄 : 나무의 갯수 N 와 원하는 길이 M 이 주어진다
 둘째줄 : 나무 각각의 높이
 
 N(1 ~ 1,000,000) M(1 ~ 2,000,000,000)
 */

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]
let lengthOfTrees = readLine()!.split(separator: " ").map { Int($0)! }

func getTree(with height: Int) -> Int {
    return lengthOfTrees.map { $0 - height }.filter { $0 > 0 }.reduce(0, +)
}

var start = 0
var end = lengthOfTrees.max()!
var mid: Int {
    return (start + end) / 2
}
while start <= end {
    if getTree(with: mid) < M {
        end = mid - 1
    } else if getTree(with: mid) > M {
        start = mid + 1
    } else {
        break
    }
}
print(mid)

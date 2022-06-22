// <11866> 요세푸스 문제 0
/*
 1번부터 N번까지 N명의 사람이 원을 이루고 앉아있고, 양의 정수 K(<=N)가 주어진다. 이제 순서대로 K번째 사람을 제거한다. 한 사람이 제거되면 남은 사람들로 이루어진 원을 따라 이 과정을 계속해 나간다. 이 과정은 N명의 사람이 모두 제거될 때 까지 계속된다. 원에서 사람들이 제거되는 순서를 (N,K) - 요세푸스 순열이라고 한다. 예를들어 , (7,3) 요세푸스 순열은 <3,6,2,7,5,1,4> 이다
     N과 K 가 주어지면 (N,K) 요세푸스 순열을 구하는 프로그램을 작성하시오.
 */

// 마이너스 값을 고려하지 않았나? ?  ? 다시 생각해보기

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]
var circle = Array<Int>(1...n)
var killIndex = 0
var resultList: [Int] = []

while circle.count > 0 {
    killIndex += k - 1
    while killIndex >= circle.count {
        killIndex -= circle.count
    }
    let killedNumber = circle.remove(at: killIndex)
    resultList.append(killedNumber)
}
var text = "<\(resultList.first!)"
for i in 1...(resultList.count - 2) {
    text += ", \(resultList[i])"
}
text += ", \(resultList.last!)>"
print(text)

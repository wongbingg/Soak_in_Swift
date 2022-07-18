/*
 <10816> 숫자카드 2
 */

let N = Int(readLine()!)!
var ownCardList = readLine()!.split(separator: " ").compactMap { Int($0) }
let M = Int(readLine()!)!
let answerCardList = readLine()!.split(separator: " ").compactMap { Int($0) }
var result: [Int] = []
answerCardList.forEach { answerNumber in
    var count = 0
    while ownCardList.contains(answerNumber) { // 배열에서 특정 정수값을 빼주어야 한다.
        if ownCardList[i] == answerNumber {
            ownCardList.remove(at: i)
            count += 1
        }
    }
    result.append(count)
}
result.forEach {print($0)}

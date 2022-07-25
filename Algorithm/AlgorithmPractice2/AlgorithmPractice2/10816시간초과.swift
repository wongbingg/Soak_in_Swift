/*
 <10816> 숫자카드 2
 */

let N = Int(readLine()!)!
var ownCardList = readLine()!.split(separator: " ").compactMap { Int($0) }
let M = Int(readLine()!)!
let answerCardList = readLine()!.split(separator: " ").compactMap { Int($0) }
var result: [String] = []

answerCardList.forEach { num in
    var count = 0
    while ownCardList.contains(num) {
        ownCardList.remove(at: ownCardList.firstIndex(of: num)!)
        count += 1
    }
    result.append(String(count))
}
print(result.joined(separator: " "))

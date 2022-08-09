/*
 <10816> 숫자카드 2
 */

let N = Int(readLine()!)!
var ownCardList = readLine()!.split(separator: " ").compactMap { Int($0) }
let M = Int(readLine()!)!
let answerCardList = readLine()!.split(separator: " ").compactMap { Int($0) }
var result: [String] = []
var hashMap = [Int: Int]()

for i in ownCardList {
    if hashMap.keys.contains(i) {
        hashMap[i]! += 1
    } else {
        hashMap[i] = 1
    }
}
for i in answerCardList {
    if hashMap.keys.contains(i) {
        result.append(String(hashMap[i]!))
    } else {
        result.append("0")
    }
}

print(result.joined(separator: " "))

//func binarySearch(to number: Int, in list: [Int]) -> Bool {
//    let orderedList = list.sorted(by: <)
//    var start = 0
//    var last = orderedList.count - 1
//    var middleIndex: Int {
//        return (last + start) / 2
//    }
//    while start <= last {
//        if orderedList[middleIndex] == number {
//
//            return true
//        } else if orderedList[middleIndex] > number {
//            last = middleIndex - 1
//        } else if orderedList[middleIndex] < number {
//            start = middleIndex + 1
//        }
//    }
//    return false
//}


// MARK: - 알고리즘 분류: 자료구조, 정렬, 이분탐색, 해시를 사용한 집합과 맵 인데, 이분탐색을 이용할 방법을 찾지 못했다 ... 

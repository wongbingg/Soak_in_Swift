//<1181> 단어정렬
// 알파벳 소문자로 이루어진 N개의 단어가 들어오면 아래와 같은 조건에 따라 정렬하는 프로그램을 작성하라
// 1. 길이가 짧은 것 부터
// 2. 길이가 같으면 사전 순으로
// <입력> 첫째 줄에 단어의 개수 N (1<= N <= 20,000) 둘째줄 부터 N개의 단어가 한줄씩 추가된다. 문자열 길이는 50을 넘지 않음

// 73068KB, 476ms ...
let N = Int(readLine()!)!
var list: [String] = []
(1...N).forEach { _ in
    let element = readLine()!
    list.append(element)
}
var resultList: [String] = []
for i in 1...50 {
    let dummyList = list.filter{ $0.count == i}
    resultList += Set(dummyList).sorted()
    if resultList.count == Set(list).count {
        break
    }
}
resultList.forEach{ print($0) }

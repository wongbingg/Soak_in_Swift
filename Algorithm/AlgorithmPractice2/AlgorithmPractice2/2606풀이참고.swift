// <2606> 바이러스

//let comNum = Int(readLine()!)!
//var comList = Array(repeating: 0, count: comNum+1)
//comList[1] = 1
//var pairList: [[Int]] = []
//let netPair = Int(readLine()!)!
//(1...netPair).forEach { _ in
//    let pair = readLine()!.split(separator: " ").compactMap { Int($0) }
//    pairList.append(pair)
//}
//pairList.forEach { pair in
//    if comList[pair[0]] == 1 || comList[pair[1]] == 1 {
//        comList[pair[0]] = 1
//        comList[pair[1]] = 1
//    }
//}
//pairList.forEach { pair in
//    if comList[pair[0]] == 1 || comList[pair[1]] == 1 {
//        comList[pair[0]] = 1
//        comList[pair[1]] = 1
//    }
//}
//var count = 0
//comList.forEach { id in
//    if id == 1 {
//        count += 1
//    }
//}
//print(count-1)

// 틀렸습니다 ..

//let comNum = Int(readLine()!)!
//var comList = Array(repeating: 0, count: comNum+1)
//var pairDic = [Int:[Int]]()
//let netPair = Int(readLine()!)!
//(1...netPair).forEach { _ in
//    let pair = readLine()!.split(separator: " ").compactMap { Int($0) }
//    if pairDic[pair[0]] != nil {
//        pairDic[pair[0]]?.append(pair[1])
//    } else {
//        pairDic[pair[0]] = [pair[1]]
//    }
//}
//
//func connect(num: Int) {
//    pairDic[num]?.forEach { num in
//        comList[num] = 1
//        connect(num: num)
//    }
//}
//connect(num: 1)
//var count = 0
//comList.forEach { one in
//    if one == 1 {
//        count += 1
//    }
//}
//print(count)

// 메모리 초과

let comNum = Int(readLine()!)!
var pairDic = [Int:[Int]]()
let netPair = Int(readLine()!)!
for num in 1...comNum { // 이렇게 초기화해주는 부부이 없으면 런타임 에러가 난다 ..
    pairDic[num] = []
}
(1...netPair).forEach { _ in
    let pair = readLine()!.split(separator: " ").compactMap { Int($0) }
    pairDic[pair[0]]?.append(pair[1])
    pairDic[pair[1]]?.append(pair[0])
}

var visited: [Int] = []
var stack: [Int] = [1]

while stack.count != 0 {
    guard let temp = stack.popLast() else { fatalError()}
    if !visited.contains(temp) {
        visited.append(temp)
        guard let temp2 = pairDic[temp] else { fatalError() }
        stack += temp2
    }
}
print(visited.count - 1)

// 그래프의 모든 정점을 탐색하는 방법인 BFS, DFS 등이 있는데 풀이에서는 DFS를 이용했다?'
// 깊이 우선 탐색인데, popLast() 를 통해 한단계 및으로 죽죽 내려가는 것 같다
// https://icksw.tistory.com/85 참고,  키워드 : 그래프이론, 그래프 탐색, 너비 우선 탐색, 깊이 우선 탐색
// Graph 검색 DFS, BFS 구현 in java https://www.youtube.com/watch?v=_hxFgg7TLZQ 영상

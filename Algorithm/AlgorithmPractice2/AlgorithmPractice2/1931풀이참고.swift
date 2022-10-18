// <1931> 회의실 배정
// greedy Algorithm

//let conferenceNum = Int(readLine()!)!
//var list: [(Int, Int)] = []
//(1...conferenceNum).forEach { _ in
//    let range = readLine()!.split(separator: " ").compactMap { Int($0) }
//    let timeRange = (range[0], range[1])
//    list.append(timeRange)
//}
//var resultArr = list.sorted { a, b in
//    a.0 < b.0
//}
//func permitConference(start: (Int, Int)) -> Int {
//    var currentConf: (Int,Int) = start
//    var permittedNum = 1
//    resultArr.forEach { elem in
//        if elem.0 >= currentConf.1 {
//            currentConf = (elem.0, elem.1)
//            permittedNum += 1
//        }
//    }
//    return permittedNum
//}
//var topValue: Int = 0 {
//    didSet {
//        if oldValue > topValue {
//            topValue = oldValue
//        }
//    }
//}
//resultArr.forEach { range in
//    topValue = permitConference(start: range)
//}
//print(topValue)

// MARK: 역시 시간초과 .. 하하 --

let conferenceNum = Int(readLine()!)!
var list: [(Int, Int)] = []
(1...conferenceNum).forEach { _ in
    let range = readLine()!.split(separator: " ").compactMap { Int($0) }
    let timeRange = (range[0], range[1])
    list.append(timeRange)
}
var resultArr = list.sorted { a, b in // 끝나는 시간을 기준으로 정렬하는 것이 관건 ..!
    if a.1 == b.1 {
        return a.0 < b.0
    } else {
        return a.1 < b.1
    }
}
var count = 0
var current = 0
resultArr.forEach { arr in
    if arr.0 >= current {
        count += 1
        current = arr.1
    }
}
print(count)


// MARK: 참고링크 https://icksw.tistory.com/32
// 근데 왜 아직 이것이 그리디 알고리즘을 사용한 것인진 잘 모르겠다.
// 핵심은 sort 과정에서 회의종료 시간이 같은 경우, 시작 시간이 빠른 것을 기준으로 정렬후, 끝나는 시간을 오름 차순으로
// 정렬하는 것

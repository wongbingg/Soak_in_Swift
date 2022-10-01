// <2579> 계단 오르기

//let stairNumber = Int(readLine()!)!
//var dp = Array(repeating: 0, count: stairNumber + 1)
//(1...stairNumber).forEach { i in
//    let point = Int(readLine()!)!
//    dp[i] = point
//}
//
//var maxPoint = 0 {
//    didSet {
//        if oldValue > maxPoint {
//            maxPoint = oldValue
//        }
//    }
//}
//
//func checkValid(order: [Int]) -> Bool {
//    guard order.count > 2 else { return true }
//    for i in 1...order.count-2 {
//        if order[i] == 1 && order[i+1] == 1 {
//            return false
//        }
//    }
//    return true
//}
//
//func calculatePoint(order: [Int]) {
//    var resultPoint = 0
//    var idx = 0
//    for i in order.indices {
//        idx += order[i]
//        resultPoint += dp[idx]
//    }
//    maxPoint = resultPoint
//}
//
//func generateArray1(currentArray: [Int]) -> [Int] {
//    var ary = currentArray
//    ary.append(1)
//    return ary
//}
//func generateArray2(currentArray: [Int]) -> [Int]? {
//    var ary = currentArray
//    if ary.last == 1 {
//        ary[ary.count-1] += 1
//        return ary
//    } else {
//        return nil
//    }
//}
//
//func generateValidArray(ary: [[Int]]) -> [[Int]] {
//    var newArray: [[Int]] = []
//    var resultAry: [[Int]] = []
//    ary.forEach { intAry in
//        newArray.append(generateArray1(currentArray: intAry))
//        if let valid = generateArray2(currentArray: intAry) {
//            newArray.append(valid)
//        }
//    }
//    newArray.forEach { intAry in
//        if checkValid(order: intAry) {
//            resultAry.append(intAry)
//        }
//    }
//    if resultAry[0].reduce(0, +) == stairNumber {
//        return resultAry
//    } else {
//        return generateValidArray(ary: newArray)
//    }
//}
//
//generateValidArray(ary: [[1]]).forEach { result in
//    calculatePoint(order: result)
//}
//print(maxPoint)
// 결과 값은 나오지만 , 메모리 초과 ..

// MARK: - https://didu-story.tistory.com/291 참고 풀이

let stairNumber = Int(readLine()!)!
var dp = Array(repeating: 0, count: stairNumber + 1)
var arr = Array(repeating: 0, count: stairNumber + 1)
(1...stairNumber).forEach { i in
    let point = Int(readLine()!)!
    arr[i] = point
}
arr[0] = 0
for i in 1...stairNumber {
    if i == 1 {
        dp[1] = arr[1]
    } else if i == 2 {
        dp[2] = arr[2] + arr[1]
    } else if i == 3 {
        dp[3] = max(arr[3] + arr[1], arr[3] + arr[2])
    } else {
        dp[i] = max(arr[i] + arr[i-1] + dp[i-3], arr[i] + dp[i-2])
    }
}

print(dp[stairNumber])

// MARK: dp 문제 정리

/*
 동작마다의 결과값을 바로바로 dp 배열에 저장해서 가장 큰 값을 구할 수 있도록 함.
 도착지에 대한 루트가 두가지 밖에 없다는 사실을 인지해야 함.
 처음 3계단 까지의 과정은 default 로 진행
 4계단째 부터는 여기까지 올라온 두 가지 루트 중 점수가 더 높은 루트를 선택.
 
 점화식(?) 이라 표현하던데 아직 잘 머름 . 
 
 */

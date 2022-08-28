// <9095> 1,2,3 더하기
// n = 1 ~ 10
// n 을 1,2,3 의 합으로 나타내는 방법
// MARK: - dynamic programming
var dp = Array(repeating: 0, count: 11)
dp[1] = 1
dp[2] = 2
dp[3] = 4
let T = Int(readLine()!)!
(1...T).forEach { _ in
    let n = Int(readLine()!)!
    for i in stride(from: 4, through: n, by: 1) { // stride는 index out of range가 발생 안한다 .. !?
        dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
    }
    print(dp[n])
}









//// 1은 1가지 경우만 나올 것
//// 2는 1+1 ,2 두가지
//// 3은 1+1+1, 1+2, 2+1, 3 네가지
//// 4는 1+1+1+1, 1+1+2, 1+2+1, , 2+1+1, 2+2, 1+3, 3+1 일곱가지 ..
//// 5는 1+1+1+1+1,1+1+1+2, 1+1+2+1, 1+2+1+1, 2+1+1+1, 1+2+2, 2+1+2, 2+2+1, 2+3, 3+2, 1+1+3, 3+1+1, 1+3+1
//func retrieveNumberOfSumCase(in number: Int) -> Int {
//    var count = 1
//    // 숫자마다 1만 이용하여 더해지는 경우 1가지 무조건 존재
//    // (1), (2), (3) 구성합
//    if number % 2 == 0 {
//        count += 1
//    }
//    if number % 3 == 0 {
//        count += 1
//    }
//
//    // (1,2) 구성합
//    count += oneTwoFunction(with: number)
//    // (1,3) 구성합
//    count += oneThreeFunction(with: number)
//    // (2,3) 구성합
//    count += twoThreeFunction(with: number)
//    // (1,2,3) 구성합
//
//    return count
//}
//
//func oneTwoFunction(with number: Int) -> Int {
//    var count = 0
//    let maxDividedCound = number / 2
//    for i in (1...maxDividedCound) {
//        let oneCount =  (number - 2*i)
//        if oneCount > 0 {
//            count += calculateCaseCount(of: [oneCount, i])
//        }
//    }
//    return count
//}
//func oneThreeFunction(with number: Int) -> Int {
//    var count = 0
//    let maxDividedCound = number / 3
//    for i in (1...maxDividedCound) {
//        let oneCount =  (number - 3*i)
//        if oneCount > 0 {
//            count += calculateCaseCount(of: [oneCount, i])
//        }
//    }
//    return count
//}
//func twoThreeFunction(with number: Int) -> Int {
//    var count = 0
//    let maxDividedCound = number / 3
//    for i in (1...maxDividedCound) {
//        let twoCount =  (number - 3*i) / 2
//        if twoCount > 0 {
//            count += calculateCaseCount(of: [twoCount, i])
//        }
//    }
//    return count
//}
//func oneTwoThreeFunction(with number: Int) -> Int {
//    var count = 0
//    let maxDividedCound = number / 3
//    for i in (1...maxDividedCound) {
//        let twoCount =  (number - 3*i) / 2
//        if twoCount > 0 {
//            count += calculateCaseCount(of: [twoCount, i])
//        }
//    }
//    return count
//}
//// MARK: - Support Methods
//
//func factorial(number: Int) -> Int {
//    var result = 1
//    (1...number).forEach { num in
//        result *= num
//    }
//    return result
//}
//
//func calculateCaseCount(of list: [Int]) -> Int {
//    let bunja = factorial(number: list.count)
//    var bunmo = 1
//    list.forEach { num in
//        if num > 1 {
//            bunmo *= factorial(number: num)
//        }
//    }
//    return bunja / bunmo
//}

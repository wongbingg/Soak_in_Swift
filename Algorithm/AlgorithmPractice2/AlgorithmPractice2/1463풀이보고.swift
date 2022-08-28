// <1463> 1로 만들기
// 동적 프로그래밍
// 동적 프로그래밍이란 ? 큰 문제를 작은 문제로 나누어 푸는 것, 그리고 작은문제가 반복적으로 발생되고 이에 대한 답이 같을 때, 사용할 수 있다.
// 이 작은 문제에 대한 답을 저장해놓고 사용하는 Memorization 기법을 이용한 문제풀이 이다. 배열에 저장해놓고 다음 값은 이전 값보다 +1 만큼의 경우의 수가 존재한다는 규칙을 적용하고, 예외사항 2, 3 으로 나누어 지는 경우도 처리해주면 된다.
var n = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1000001)
if n == 1 {
    print("0")
} else {
    for i in 2...n {
        dp[i] = dp[i - 1] + 1
        if i % 2 == 0 {
            dp[i] = min(dp[i], dp[i/2] + 1)
        }
        if i % 3 == 0 {
            dp[i] = min(dp[i], dp[i/3] + 1)
        }
    }
    print(dp[n])
}

// 블로그 풀이를 고대로 가져다 썼는데 틀림..ㅋㅋ 블로그 믿을만하지 않다
//func caseDivide() -> Int { // 틀림.. 왜 ?
//    let n = Int(readLine()!)!
//    if n == 1 {
//        return 0
//    } else if n == 2 || n == 3 {
//        return 1
//    } else {
//        var dp = Array(repeating: 0, count: n + 1)
//        dp[1] = 0
//        dp[2] = 1
//        dp[3] = 1
//        for i in 4...n {
//            if i % 3 == 0 {
//                dp[i] = min(dp[i-1] + 1, dp[i/3] + 1)
//            } else if i % 2 == 0 {
//                dp[i] = min(dp[i-1] + 1, dp[i/2] + 1)
//            } else {
//                dp[i] = dp[i-1] + 1
//            }
//        }
//        return dp[n]
//    }
//}
//print(caseDivide())

// 나의 풀이 ... 10, 16, 22, 28 등과 같은 엣지케이스들을 구해 이 때만 caseDivide 와 N-1 을 해준 뒤 caseDivide 두경우를 비교해 프로세스가 더 적은 쪽을 출력하게 해 주었다.
//MARK: - 블로그 참조풀이 틀림..

//func solution() -> Int{
//    let n = Int(readLine()!)!
//    if n == 1 {
//        return 0
//    } else if n == 2 {
//        return 1
//    } else if n == 3 {
//        return 1
//    } else {
//        var dp: [Int] = [Int](repeating: 0, count: n+1)
//        dp[1] = 0
//        dp[2] = 1
//        dp[3] = 1
//
//        for i in 4...n{
//            if i % 3 == 0 {
//                dp[i] = min(dp[i-1] + 1, dp[i/3] + 1)
//            } else if i % 2 == 0{
//                dp[i] = min(dp[i-1] + 1, dp[i/2] + 1)
//            } else {
//                dp[i] = dp[i-1] + 1
//            }
//        }
//        return dp[n]
//    }
//}
//
//print(solution())

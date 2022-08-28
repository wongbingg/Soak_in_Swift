// <1003> 피보나치 함수
// 동적프로그래밍
// 이제 감 잡읍

let T = Int(readLine()!)!
var dp = Array(repeating: (0,0), count: 41)
dp[0] = (1,0)
dp[1] = (0,1)
(1...T).forEach { _ in
    let result = fibonacci()
    print(result.0, result.1)
}
func fibonacci() -> (Int, Int) {
    let input = Int(readLine()!)!
    if input == 0 {
        return (1,0)
    } else if input == 1 {
        return (0,1)
    }
    for i in 2...input {
        dp[i] = (dp[i-1].0 + dp[i-2].0, dp[i-1].1 + dp[i-2].1)
    }
    return (dp[input].0, dp[input].1)
}

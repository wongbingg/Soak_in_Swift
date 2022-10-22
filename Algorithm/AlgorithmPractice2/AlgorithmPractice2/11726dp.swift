// <11726> 2xn 타일링


func dp() {
    let n = Int(readLine()!)!
    var dp = Array(repeating: 0, count: 1001)
    dp[1] = 1
    dp[2] = 2
    if n < 3 {
        print(dp[n])
        return
    }
    for i in 3...n {
        dp[i] = (dp[i-1] % 10007) + (dp[i-2] % 10007)
    }
    let result = dp[n] % 10007
    print(result)
}
dp()

// 이번 문제는 1 ~ 1000 까지의 범위를 준수하는데에 초점을 맞추었다.
// dp 문제는 5정도 까지 직접 적어서 풀어보면 규칙이 보인다. 그 규칙을 따라가면 된다.

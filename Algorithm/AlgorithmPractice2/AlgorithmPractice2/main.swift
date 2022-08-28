// <2579> 계단 오르기

let stairNumber = Int(readLine()!)!
var dp = Array(repeating: (0,0), count: stairNumber + 1)
var dp2 = Array(repeating: (0,0), count: stairNumber + 1)
(1...stairNumber).forEach { i in
    let point = Int(readLine()!)!
    dp[i] = (0,point)
    dp2[i] = (0,point)
}
func goUpStair(at start: Int, with dp: [(Int,Int)]) {
    var dp = dp
    dp[start].0 = 1  // 현재 계단과 이전 계단이 1인지 확인 후 아니면 1,2 이동 가능/ 맞으면 2만 이동가능
    if start == stairNumber {
        return
    }
    if start == stairNumber - 2 {
        dp[start+2].0 = 1
        return goUpStair(at: start+2, with: dp)
    }
    if dp[start].0 == 1 && dp[start-1].0 == 1 {
        dp[start+2].0 = 1
        goUpStair(at: start+2, with: dp)
    } else {
        if start + 1 == stairNumber {
            return goUpStair(at: start+1, with: dp)
        }
        if dp[start+1] < dp[start+2] {
            goUpStair(at: start+2, with: dp)
        } else {
            goUpStair(at: start+1, with: dp)
        }
    }
}
goUpStair(at: 1, with: dp)
goUpStair(at: 2, with: dp2)
print(dp)
print(dp2)

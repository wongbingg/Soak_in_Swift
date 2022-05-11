//<2525> 오븐시계
//입력 첫번째줄: 현재시각 A시 (0~23) B분 (0~59)
//입력 두번째줄: 걸리는시간 C (0~1000분)

let nowTime = readLine()?.split(separator: " ").map{ Int($0)! } ?? [0]
var A = nowTime[0] // 현재 시
var B = nowTime[1] // 현재 분
let C = Int(readLine()!)! // 걸리는 분
A += Int((B + C) / 60)
B = (B + C) % 60
if A >= 24 {
    A -= 24
}
print(A,B)

//<2475> 검증수
// 처음 5자리는 00000 ~ 99999 마지막자리는 검증수(앞 5자리수를 각각 제곱한 수의 합을 10으로 나눈 나머지)

let input = readLine()?.split(separator: " ").map{ Int($0)!} ?? [0]
var totalSum = 0
input.forEach{ totalSum += $0 * $0 }
print(totalSum % 10)


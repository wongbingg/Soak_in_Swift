// <11399> ATM
// 운영체제에서 프로세스별 우선순위를 정하는 과정과 비슷한 것 같다
// 시간이 적은 순으로 먼저 처리를 해주자

let N = Int(readLine()!)!
let times = readLine()!.split(separator: " ").compactMap { Int($0) }
let reorderedTimes = times.sorted(by: <)
var totalTime = 0
for i in 0...N-1 {
    totalTime += reorderedTimes[0...i].reduce(0, +)
}
print(totalTime)

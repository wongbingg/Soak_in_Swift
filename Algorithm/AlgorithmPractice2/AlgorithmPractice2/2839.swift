//<2839> 설탕배달
// 3 과 5를 이용하여 N을 이룰 수 있는 최소 사용숫자를 구하라 (1시간)

let N = Double(readLine()!)!
var resultList:[Int] = []

for i in 0... {
    let isIntY:Double = (N - (3.0 * Double(i))) / 5.0
    if isIntY < 0 {
        break
    }
    if isIntY >= 0 && Int(isIntY * 10) % 10 == 0 {
        resultList.append(i + Int(isIntY))
    }
}

if resultList == [] {
    print(-1)
} else {
    print(resultList.min()!)
}


//<9020> 골드바흐 추출 메모리, 시간, 코드길이 줄이기
// 79622KB 1632ms 1056B -> 79644KB 28ms 689B 성공!!!

/// 1. 소수배열의 중간지점부터 시작해서 찾아나가는 방식을 이용했다
/// 2. 불필요한 배열생성 및 모든 과정을 제거했다.

import Foundation

func isPrimeNum(_ number: Int) -> Bool {
    guard number >= 2 else {return false}
    if number == 2 || number == 3 {
        return true
    }
    for i in 2...Int(sqrt(Double(number))) {
        if number % i == 0 { 
            return false
        }
    }
    return true
}
func goldBach(_ n: Int) -> String {
    var str = ""
    for j in (2...(n / 2)).reversed() {
        if isPrimeNum(j) && isPrimeNum(n - j) {
            str = "\(j) \(n - j)"
            break
        }
    }
    return str
}
var results:[String] = []
for _ in 1...Int(readLine()!)! {
    let n = Int(readLine()!)!
    results.append(goldBach(n))
}
for result in results {
    print(result)
}

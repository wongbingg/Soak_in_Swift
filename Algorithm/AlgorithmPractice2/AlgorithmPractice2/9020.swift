//<9020> 골드바흐의 추측
// 2보다 큰 모든 짝수는(4 ~ ) 두 소수의 합으로 나타낼 수 있다. 이런 수를 골드바흐 수라고 한다.
//(2+2), (5+3) 등 짝수를 만들어 내는 pair를 골드바흐 파티션 이라고 한다 .
// 2보다 큰 짝수 n이 주어지면, 파티션을 출력하는 프로그램을 작성하라 .
// 만약 가능한 파티션이 여러가지이면, ex) N = 20 (3, 17) (7,13) 두 수 차이가 적은 (7,13) 출력

/// 1. 범위내의 소수배열 생성
/// 2. 각 테스트케이스 별로 입력값 n을 소수배열안의 요소들을 for문으로 돌리며 하나씩 빼고, 뺀 결과값이 소수배열안에 포함되어 있는지 확인
/// 3. 포함되어 있다면, 그 두 수를 저장
/// 4. 저장된 두 수의 차이값을 비교해 차이값이 제일 적은 두 수를 선정
/// 5.프린트


let testcaseT = Int(readLine()!)!

let M = 2
let N = 5100

var primeNumberList = Array<Int>(repeating: 0, count: N + 1) // [0,0,0,0,0....]
(2...N).forEach { i in
    primeNumberList[i] = i
}

for j in 2...N {
    if primeNumberList[j] == 0 {continue}
    for k in stride(from: j + j, through: N, by: j) {
        primeNumberList[k] = 0
    }
}
primeNumberList = Array(Set(primeNumberList)).sorted()
primeNumberList.remove(at: primeNumberList.startIndex)
// primeNumberList 안에는 2...10000 사이의 소수 배열이 들어간다.

var result: [String] = []

for _ in 1...testcaseT {
    var resultLeft: [Int] = []
    var resultRight: [Int] = []
    var numLeft: Int = 0
    var numRight: Int = 0
    var lessDiff: UInt = 10000
    let n = Int(readLine()!)! // 4,6,8,10,....짝수입력
    
    for primeNum in primeNumberList {
        if primeNum > n {
            break
        }
        if primeNumberList.contains(n - primeNum){
            resultLeft.append(primeNum)
            resultRight.append(n - primeNum)
        }
    }
    for idx in resultLeft.indices {
        if (resultLeft[idx] - resultRight[idx]).magnitude < lessDiff {
            lessDiff = (resultLeft[idx] - resultRight[idx]).magnitude
            numLeft = resultLeft[idx]
            numRight = resultRight[idx]
        }
    }
    result.append("\(numLeft) \(numRight)")
}

for str in result {
    print(str)
}




//<11729> 하노이 탑 이동 순서

// 핵심: hanoi(N)은 hanoi(N-1)을 거친다
//https://shoark7.github.io/programming/algorithm/tower-of-hanoi 블로그 참고

let inputValue = Int(readLine()!)!
var result: [String] = []

func hanoi(N: Int,start A: String ,to C: String ,via B: String) {
    if N == 1 {
        move(start: A, to: C)
    } else {
        hanoi(N: N - 1, start: A, to: B, via: C)
        move(start: A, to: C)
        hanoi(N: N - 1, start: B, to: C, via: A)
    }
}

func move(start: String, to: String) {
    result.append("\(start) \(to)")
}

hanoi(N: inputValue, start: "1", to: "3", via: "2")
print(result.count)
result.forEach{ print($0)}

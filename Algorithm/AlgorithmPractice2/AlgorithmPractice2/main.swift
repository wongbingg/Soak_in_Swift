//<11729> 하노이 탑 이동 순서

let N = Int(readLine()!)!
var result: [String] = []

func hanoi(N: Int,start: String ,to: String ,via: String) {
    if N == 1 {
        move(start: start, to: to)
    } else {
        hanoi(N: N - 1, start: start, to: via, via: to)
        move(start: start, to: to)
        hanoi(N: N - 1, start: via, to: to, via: start)
    }
}

func move(start: String, to: String) {
    result.append("\(start) \(to)")
}

hanoi(N: N, start: "1", to: "3", via: "2")
print(result.count)
result.forEach{ print($0)}

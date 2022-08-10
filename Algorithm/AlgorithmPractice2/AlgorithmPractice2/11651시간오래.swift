//<11651> 좌표 정렬하기 2

let N = Int(readLine()!)!
var result: [[Int]] = []
(1...N).forEach { _ in
    let point = readLine()!.split(separator: " ").compactMap { Int($0) }
    result.append(point)
}
result = result.sorted { a, b in
    if a[1] == b[1] {
        return a[0] < b[0]
    }
    return a[1] < b[1]
}

result.forEach { print($0[0],$0[1]) }

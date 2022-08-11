//<1654> 랜선 자르기


let KN = readLine()!.split(separator: " ").compactMap { Int($0) }
let K = KN[0]
let N = KN[1]
var list = [Int]()
(1...K).forEach { _ in
    let lan = Int(readLine()!)!
    list.append(lan)
}

var start = 1
var end = list.reduce(0, +) / N
var mid: Int {
    return (start + end) / 2
}

func productCount(with length: Int) -> Int {
    return list.map { $0 / length }.reduce(0, +)
}

while start <= end {
    if productCount(with: mid) < N {
        end = mid - 1
    } else if productCount(with: mid) > N {
        start = mid + 1
    } else {
        if productCount(with: mid + 1) < N {
            break
        } else {
            start = mid + 1
        }
    }
}
print(mid)

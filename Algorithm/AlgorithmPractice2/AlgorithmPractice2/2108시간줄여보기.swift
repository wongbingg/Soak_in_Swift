// <2108> 통계학
import Foundation

let N = Int(readLine()!)!
var list = [Int]()
var result = [Int]()
(1...N).forEach { _ in
    let inputNumber = Int(readLine()!)!
    list.append(inputNumber)
}
let mean = Int(round(Double(list.reduce(0, +)) / Double(list.count)))
let median = list.sorted()[list.count/2]
var mode: [Int] = []
let range = list.max()! - list.min()!

var modeDic: [Int: Int] = [:]
list.forEach { num in
    if modeDic.keys.contains(num) {
        modeDic[num]! += 1
    } else {
        modeDic[num] = 1
    }
}
var maxValue = 0 {
    didSet {
        if maxValue < oldValue {
            maxValue = oldValue
        }
    }
}
modeDic.values.forEach { value in
    maxValue = value
}
for (key, value) in modeDic {
    if value == maxValue {
        mode.append(key)
    }
}

print(mean)
print(median)
if mode.count == 1 {
    print(mode[0])
} else {
    print(mode.sorted(by: <)[1])
}
print(range)

// 딕셔너리에서 밸류값이 가장 큰 키값이 mode 값이 된다.
// 그런데, 최빈값이 여러개 일 때는 최빈값 중 두번째로 작은 값을 출력

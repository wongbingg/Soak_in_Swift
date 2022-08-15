// <18111> 마인크래프트
// 1. 블록의 여유가 된다면 아예 다 덮어서 평탄화
// 2. 블록의 여유가 없다면 아예 다 까서 평탄화
// 3. 덮고 까는 중간쯤으로 평탄화

let input = readLine()!.split(separator: " ").map { Int($0)! }
var totalTime = 0
let N = input[0]
let M = input[1]
var B = input[2]

var grid: [[Int]] = []
(1...N).forEach { _ in
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    grid.append(row)
}
var max: Int {
    grid.flatMap { Array($0) }.max()!
}
var list: ArraySlice<Int> {
    var mockList = Array(repeating: 0, count: 257)
    grid.flatMap { Array($0) }.forEach { num in
        mockList[num] += 1
    }
    let list = mockList[0...max]
    return list
}

//let averageHeight: Int = grid.flatMap { Array($0) }.reduce(0, +) / (N * M)
let mostHighFrequencyValue = list.firstIndex(of: list.max()!)!

func blockProcess(with value: Int) -> (Int, Int) {
    let operationIndicator = generateBlockOperationIndicator(with: value)
    if operationIndicator.0 == operationIndicator.1 {
        return ((operationIndicator.0 * 1) + (operationIndicator.1 * 2), value)
    } else if operationIndicator.0 < operationIndicator.1 {
        return ((operationIndicator.0 * 1) + (operationIndicator.1 * 2), value)
    } else { // put 해야할 블록수가 더 많은 경우
        if B >= operationIndicator.0 - operationIndicator.1 {
            return ((operationIndicator.0 * 1) + (operationIndicator.1 * 2), value)
        } else {
            return blockProcess(with: value - 1)
        }
    }
}

func generateBlockOperationIndicator(with standardValue: Int) -> (Int, Int) {
    var pull = 0
    var put =  0
    for i in 0...N-1 {
        for j in 0...M-1 {
            if grid[i][j] == standardValue {
                continue
            } else if grid[i][j] > standardValue {
                let gap = grid[i][j] - standardValue
                pull += gap
            } else if grid[i][j] < standardValue {
                let gap = standardValue - grid[i][j]
                put += gap
            }
        }
    }
    return (put, pull)
}

func blockProcess2(with value: Int) -> (Int, Int) { // 블록이 넉넉한경우 다 채워버리는 과정
    let indicator = generateBlockOperationIndicator(with: value)
    if B >= indicator.0 - indicator.1 {
        return ((indicator.0 * 1) + (indicator.1 * 2), value)
    } else {
        return blockProcess2(with: value - 1)
    }
}
var resultList = [(Int,Int)]()
let result = blockProcess(with: mostHighFrequencyValue)
resultList.append(result)

for i in 0...10 {
    let result = blockProcess(with: max - i)
    resultList.append(result)
}
resultList = resultList.sorted { a, b in
    if a.0 == b.0 {
        return a.1 > b.1
    }
    return a.0 < b.0
}
print(resultList[0].0, resultList[0].1)

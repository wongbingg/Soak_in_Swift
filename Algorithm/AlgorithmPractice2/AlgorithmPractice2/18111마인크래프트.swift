// <18111> 마인크래프트
// 1. 블록의 여유가 된다면 아예 다 덮어서 평탄화
// 2. 블록의 여유가 없다면 아예 다 까서 평탄화
// 3. 덮고 까는 중간쯤으로 평탄화
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Int]
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Int {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
struct Process {
    let put: Int
    let pull: Int
    let stock: Int
    var isPossible: Bool {
        if put <= pull {
            return true
        } else {
            if (put - pull) > stock {
                return false
            } else {
                return true
            }
        }
    }
    var totalTime: Int {
        return (put * 1) + (pull * 2)
    }
}
let input = readLine()!.split(separator: " ").map { Int($0)! }
var totalTime = 0
let N = input[0]
let M = input[1]
var B = input[2]
var grid = [Int]()
(1...N).forEach { _ in
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    grid += row
}

var matrix = Matrix(rows: N, columns: M, grid: grid) // 행렬을 관리할 수 있다.
// 기준높이를 0 ~ 256 까지 모두 검사하여 시간이 가장 짧은 경우를 구해라.

func calculateNeededProcess(with criteriaHeight: Int) -> Process {
    var putBlock = 0
    var pullBlock = 0
    for i in 0...N-1 {
        for j in 0...M-1 {
            if (criteriaHeight - matrix[i,j]) > 0 {
                putBlock += (criteriaHeight - matrix[i,j])
            } else if (criteriaHeight - matrix[i,j]) < 0 {
                pullBlock -= (criteriaHeight - matrix[i,j])
            }
        }
    }
    let process = Process(put: putBlock, pull: pullBlock, stock: B)
    return process
}

func brutforceSearch() {
    var resultArray: [(Int,Int)] = []
    for criteria in 0...256 {
        let process = calculateNeededProcess(with: criteria)
        if process.isPossible {
//            print("총 시간: \(process.totalTime) , 기준 높이: \(criteria)")
            resultArray.append((process.totalTime, criteria))
        } else {
            break
        }
    }
    resultArray = resultArray.sorted { a, b in
        if a.0 == b.0 {
            return a.1 > b.1
        }
        return a.0 < b.0
    }
    print(resultArray[0].0, resultArray[0].1)
}

brutforceSearch()


















//var grid: [[Int]] = []
//(1...N).forEach { _ in
//    let row = readLine()!.split(separator: " ").map { Int($0)! }
//    grid.append(row)
//}
//var max: Int {
//    grid.flatMap { Array($0) }.max()!
//}
//var list: ArraySlice<Int> {
//    var mockList = Array(repeating: 0, count: 257)
//    grid.flatMap { Array($0) }.forEach { num in
//        mockList[num] += 1
//    }
//    let list = mockList[0...max]
//    return list
//}

/*
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
*/

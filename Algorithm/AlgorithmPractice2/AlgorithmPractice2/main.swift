// <18111> 마인크래프트
// 1. 블록의 여유가 된다면 아예 다 덮어서 평탄화
// 2. 블록의 여유가 없다면 아예 다 까서 평탄화
// 3. 덮고 까는 중간쯤으로 평탄화
var mockList = Array(repeating: 0, count: 257)
let input = readLine()!.split(separator: " ").map { Int($0)! }
var totalTime = 0
let N = input[0]
let M = input[1]
var B = input[2]

var grid: [[Int]] = []
var isFlat: Bool {
    return Set(grid.flatMap { Array($0) }).count == 1
}

(1...N).forEach { _ in
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    grid.append(row)
}
let max = grid.flatMap { Array($0) }.max()!
let min = grid.flatMap { Array($0) }.min()!
let list = mockList[0...max] // 어느높이가 더 점유율이 많은지 체크가능

//MARK: - Methods
// (i,j)에서 블록 꺼내기
func pullBlock(i: Int, j: Int) {
    grid[i][j] -= 1
    B += 1
    totalTime += 2
}
// (i,j)에 블록 채우기
func putBlock(i: Int, j: Int) {
    guard B > 0 else { return }
    grid[i][j] += 1
    B -= 1
    totalTime += 1
}

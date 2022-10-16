// <1926> 그림
// MARK: 1012번을 풀고 비슷한 풀이를 적용하니 금방 풀었다

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0]
let m = input[1]
var grid: [[Int]] = []
(1...n).forEach { _ in
    let row = readLine()!.split(separator: " ").compactMap { Int($0) }
    grid.append(row)
}
var count = 0
var maxCount: Int = 0 {
    didSet {
        if maxCount < oldValue {
            maxCount = oldValue
        }
    }
}
for i in 0..<n {
    for j in 0..<m {
        if grid[i][j] == 1 {
            var num = 0
            dfs(i, j, grid: &grid, num: &num)
            count += 1
            maxCount = num
        }
    }
}
print(count, maxCount, separator: "\n")

func dfs(_ x: Int, _ y: Int, grid: inout [[Int]], num: inout Int) {
    guard x >= 0 && y >= 0 && x < n && y < m && grid[x][y] == 1 else { return }
    num += 1
    grid[x][y] = 0
    dfs(x + 1, y, grid: &grid, num: &num)
    dfs(x, y + 1, grid: &grid, num: &num)
    dfs(x - 1, y, grid: &grid, num: &num)
    dfs(x, y - 1, grid: &grid, num: &num)
}

// <1012> 유기농 배추
// 배추흰지렁이는 상하좌우로 전파될 수 있다.
// 각 테스트케이스마다 가로M x 세로N , 배추의 개수 가 주어진다.
// 이때, 필요한 배추흰지렁이 수를 구한다.
// 배추가 심어진 위치를 상하좌우 전파 가능한 그룹들로 묶어서, 해당 그룹의 수를 구하면 된다.
// 상하좌우에 있다는 조건은 즉, 어떤 점에서 x 로 절대값 1만큼, y로 절대값 1만큼 움직인 거리에
// 다른 배추가 있다는 사실이 확인이 되면 두 점은 연결된 것이다.
// 확인된 점으로 넘어가 같은 루틴을 반복해보면 이어진 점들에 대한 그룹을 만든다 (재귀를 이용)
// MARK: - 그래프이론, 그래프탐색, 너비 우선 탐색, 깊이 우선 탐색

let T = Int(readLine()!)!

(1...T).forEach { _ in
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let M = input[0]
    let N = input[1]
    let K = input[2]
    let row = Array(repeating: 0, count: M)
    var grid = Array(repeating: row, count: N)
    
    (1...K).forEach { _ in
        let inputPoint = readLine()!.split(separator: " ").compactMap { Int($0) }
        grid[inputPoint[1]][inputPoint[0]] = 1
    }
    var count = 0
    for i in 0..<N {
        for j in 0..<M {
            if grid[i][j] == 1 {
                count += 1
                moveToNext(at: (i,j), target: &grid, m: M, n: N)
            }
        }
    }
    print(count)
}

func moveToNext(at point: (Int, Int),
                target grid: inout [[Int]],
                m: Int,
                n: Int) {
    guard point.0 >= 0 &&
            point.0 < n &&
            point.1 >= 0 &&
            point.1 < m &&
            grid[point.0][point.1] == 1 else { return }
    grid[point.0][point.1] = 2
    moveToNext(at: (point.0 + 1, point.1), target: &grid, m: m, n:n)
    moveToNext(at: (point.0, point.1 + 1), target: &grid, m: m, n:n)
    moveToNext(at: (point.0 - 1, point.1), target: &grid, m: m, n:n)
    moveToNext(at: (point.0, point.1 - 1), target: &grid, m: m, n:n)
}

// MARK: - 예시문제는 정답이 잘 나오는데 제출하니 틀렸다 .. 왜틀렸지 왜 왜 왜 왜
// 난 입력받은 point를 기준으로 그룹지점들을 2로 바꿔준 후, 끝나면 1을 더해주는 방식의 로직을 짯는데
// 블로그에선 그냥 point 기준으로 그리드에 표시해놓고, 전체 영역을 돌며 1을 만나면 그 1을 기준으로
// 연결지점들을 모조리 0으로 바꿔주었다.
// https://seolhee2750.tistory.com/129 참고

//let T = Int(readLine()!)!
//
//func dfs(x: Int, y: Int, land: inout [[Int]], m: Int, n: Int) {
//    if x < 0 || x >= n || y < 0 || y >= m || land[x][y] != 1 { return }
//
//    land[x][y] = 0
//
//    dfs(x: x+1, y: y, land: &land, m: m, n: n)
//    dfs(x: x, y: y+1, land: &land, m: m, n: n)
//    dfs(x: x-1, y: y, land: &land, m: m, n: n)
//    dfs(x: x, y: y-1, land: &land, m: m, n: n)
//}
//
//(1...T).forEach { _ in
//    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
//    let m = input[0]
//    let n = input[1]
//    let num = input[2]
//    var land = Array(repeating: Array(repeating: 0, count: m), count: n)
//    var count = 0
//
//    (1...num).forEach { _ in
//        let location = readLine()!.split(separator: " ").compactMap { Int($0) }
//        land[location[1]][location[0]] = 1
//    }
//
//    for i in 0..<n {
//        for j in 0..<m {
//            if land[i][j] == 1 {
//                count += 1
//                dfs(x: i, y: j, land: &land, m: m, n: n)
//            }
//        }
//    }
//    print(count)
//}

// <11724> 연결 요소의 개수

//let input = readLine()!.split(separator: " ").compactMap { Int($0) }
//let n = input[0]
//let m = input[1]
//var visited = Array(repeating: false, count: n + 1)
//var dic = [Int: [Int]]()
//(1...m).forEach { _ in
//    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
//    let first = line[0]
//    let second = line[1]
//    if dic[first] == nil {
//        dic[first] = [second]
//    } else {
//        dic[first]?.append(second)
//    }
//    if dic[second] == nil {
//        dic[second] = [first]
//    } else {
//        dic[second]?.append(first)
//    }
//}
//
//func dfs(_ point: Int) {
//    visited[point] = true
//    dic[point]?.forEach { num in
//        if visited[num] == false {
//            dfs(num)
//        }
//    }
//}
//var element = 0
//for i in 1...n {
//    if visited[i] == false {
//        element += 1
//        dfs(i)
//    }
//}
//print(element)

// MARK: - 런타임 에러.. 딕셔너리를 쓰면 안되는 것인가.. 배열로 변경 해줌

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0]
let m = input[1]
var visited = Array(repeating: false, count: n + 1)
var list: [[Int]] = Array(repeating: [], count: n + 1)
(1...m).forEach { _ in
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    list[line[0]].append(line[1])
    list[line[1]].append(line[0])
}

func dfs(_ point: Int) {
    visited[point] = true
    for i in 0..<list[point].count {
        let next = list[point][i]
        if visited[next] == false {
            dfs(next)
        }
    }
}
var element = 0
for i in 1...n {
    if visited[i] == false {
        element += 1
        dfs(i)
    }
}
print(element)

// MARK: - 런타임에러가 여전히 남아있는 블로그 예시 .. 왜올려논겨 이건



// MARK: - 런타임에러가 나지 않는 블로그 예시 https://zest1923.tistory.com/m/87
// 내 코드와 어떤 차이점이 있는지 알아보자


//let datas = readLine()!.split(separator: " ").map{ Int($0)! }
//var graph = [[Int]](repeating: [], count: datas[0] + 1)
//var visited = [Bool](repeating: false, count: datas[0] + 1)
//var result = 0
//for _ in 0..<datas[1]{
//    let edges = readLine()!.split(separator: " ").map{ Int($0)! }
//    graph[edges[0]].append(edges[1])
//    graph[edges[1]].append(edges[0])
//}
//for node in 1...datas[0]{
//    if !visited[node]{
//        result += dfs(v: node)
//    }
//}
//print(result)
//
//func dfs(v: Int) -> Int{
//    visited[v].toggle()
//    for node in graph[v]{
//        if !visited[node]{
//            dfs(v: node) // 여기서 호출된건 신경쓰지 않기!
//        }
//    }
//    return 1
//}

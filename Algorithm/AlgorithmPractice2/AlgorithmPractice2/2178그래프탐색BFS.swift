// <2178> 미로찾기
// 그래프탐색, 너비우선 탐색

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = input[0]
let M = input[1]
var grid: [[Int]] = []
var visitGrid = Array(repeating: Array(repeating: 0, count: M), count: N)
(1...N).forEach { _ in
    var row: [Int] = []
    let input = readLine()!
    for char in input {
        row.append(Int(String(char))!)
    }
    grid.append(row)
}
var queue = Queue<(node: (Int, Int), depth: Int)>()
func bfs(_ r: Int, _ c: Int) -> Int {
    queue.enqueue(data: ((r,c), 1))
    visitGrid[r][c] = 1
    
    while !queue.isEmpty {
        let current = queue.dequeue()
        if current!.node == (N-1, M-1) { return current!.depth }
        let adjacents = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        for adj in adjacents {
            let adjRow = current!.node.0 + adj.0
            let adjCol = current!.node.1 + adj.1
            guard adjRow >= 0 && adjRow < N && adjCol >= 0 && adjCol < M else { continue }
            let adjNode = (adjRow, adjCol)
            
            if visitGrid[adjRow][adjCol] == 0 && grid[adjRow][adjCol] == 1 {
                visitGrid[adjRow][adjCol] = 1
                queue.enqueue(data: (node: adjNode, depth: current!.depth + 1))
            }
        }
    }
    return 0
}

print(bfs(0, 0))

class Node<T> {
    var data: T
    var next: Node<T>?
    init(_ data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class Queue<T> {
    var head: Node<T>?
    var isEmpty: Bool {
        head == nil
    }
    
    func enqueue(data: T) {
        if head == nil {
            head = Node(data)
        } else {
            var node = head
            while node?.next != nil {
                node = node?.next
            }
            node?.next = Node(data)
        }
    }

    func dequeue() -> T? {
        guard head != nil else {
            return nil
        }
        
        let removedNode = head
        head = head?.next
        
        return removedNode?.data
    }
}

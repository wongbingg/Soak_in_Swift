// <1260> DFS와 BFS
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
let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = input[0] // 정점의 갯수
let M = input[1] // 간선의 갯수
let V = input[2] // 시작할 정점

var visitHistory = Array(repeating: 0, count: N+1)
var visitHistory2 = Array(repeating: 0, count: N+1)

var dic = [Int: [Int]]()
(1...M).forEach { _ in
    let bindLine = readLine()!.split(separator: " ").compactMap { Int($0) }
    let first = bindLine[0]
    let second = bindLine[1]
    if dic[first] == nil {
        dic[first] = [second]
    } else {
        dic[first]?.append(second)
    }
    if dic[second] == nil {
        dic[second] = [first]
    } else {
        dic[second]?.append(first)
    }
}

var result = [Int]()

func dfs(point: Int) {
    guard point >= 1 && point <= N && visitHistory[point] == 0  else {
        return
    }
    visitHistory[point] = 1
    result.append(point)
    dic[point]?.sorted(by: <).forEach{ num in
        dfs(point: num)
    }
}

var queue = Queue<Int>()
var result2 = [Int]()
func bfs(point: Int) {
    result2.append(point)
    queue.enqueue(data: point)
    visitHistory2[point] = 1
    while queue.isEmpty == false {
        let item = queue.dequeue()!
        dic[item]?.sorted(by: <).forEach { num in // 이부분에서 dic[item]!.sorted 이런식의 접근을 했더니 런타임 오류가 나왔다. 딕셔너리를 사용할 때 항상 고려 해주어야 겠다
            if visitHistory2[num] == 0 {
                result2.append(num)
                visitHistory2[num] = 1
                queue.enqueue(data: num)
            }
        }
    }
}

dfs(point: V)
result.forEach { print($0, terminator: " ") }
print("")
bfs(point: V)
result2.forEach { print($0, terminator: " ") }


// MARK: - Dictionary 때문에 런타임 오류 !
// 86번 라인에 강제언래핑을 사용했었는데 런타임 오류가 났다.
// 오류입력
// 1000 1 1
// 99 1000
// 어떠한 간선도 가지지 않는 정점 1을 입력했기 때문에 dictionary에서 인식하지 못했던 것이다.
// 이럴 경우에 런타임 에러가 난다는 사실을 꼭 기억해두자

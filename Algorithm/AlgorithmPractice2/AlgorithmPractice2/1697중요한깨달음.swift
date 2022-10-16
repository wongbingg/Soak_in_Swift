// <1697> 숨바꼭질
// 그래프 너비우선 탐색법
//class Node<T> {
//    var data: T
//    var next: Node<T>?
//    init(_ data: T, next: Node? = nil) {
//        self.data = data
//        self.next = next
//    }
//}
//
//class Queue<T> {
//    var head: Node<T>?
//    var isEmpty: Bool {
//        head == nil
//    }
//
//    func enqueue(data: T) {
//        if head == nil {
//            head = Node(data)
//        } else {
//            var node = head
//            while node?.next != nil {
//                node = node?.next
//            }
//            node?.next = Node(data)
//        }
//    }
//
//    func dequeue() -> T? {
//        guard head != nil else {
//            return nil
//        }
//
//        let removedNode = head
//        head = head?.next
//
//        return removedNode?.data
//    }
//}
//
//let input = readLine()!.split(separator: " ").compactMap { Int($0) }
//let n = input[0]
//let k = input[1]
//var visitArray = Array(repeating: false, count: 100000)
//var queue = Queue<(point: Int, depth: Int)>()
//func bfs(_ node: (point: Int, depth: Int)) -> Int {
//    if node.point > k {
//        return node.point - k
//    }
//    queue.enqueue(data: node)
//    while queue.isEmpty == false {
//        let item = queue.dequeue()!
//        guard item.point >= 0 && item.point <= k else { continue }
//        if item.point == k {
//            return item.depth
//        }
//        if visitArray[item.point] == false {
//            visitArray[item.point] = true
//            let item1 = (point: item.point + 1, depth: item.depth + 1) // 100000일 때 예외
//            queue.enqueue(data: item1)
//            let item2 = (point: item.point - 1, depth: item.depth + 1) // 0일 때 예외
//            queue.enqueue(data: item2)
//            let item3 = (point: item.point*2, depth: item.depth + 1) // 50000 초과일 때 예외
//            queue.enqueue(data: item3)
//        }
//    }
//    return 0
//}
//print(bfs((point: n, depth: 0)))
// MARK: - 시간초과

//class Node<T> {
//    var data: T
//    var next: Node<T>?
//    init(_ data: T, next: Node? = nil) {
//        self.data = data
//        self.next = next
//    }
//}
//
//class Queue<T> {
//    var head: Node<T>?
//    var isEmpty: Bool {
//        head == nil
//    }
//
//    func enqueue(data: T) {
//        if head == nil {
//            head = Node(data)
//        } else {
//            var node = head
//            while node?.next != nil {
//                node = node?.next
//            }
//            node?.next = Node(data)
//        }
//    }
//
//    func dequeue() -> T? {
//        guard head != nil else {
//            return nil
//        }
//
//        let removedNode = head
//        head = head?.next
//
//        return removedNode?.data
//    }
//}
// MARK: - 큐 구현이 문제인가 ? , 전역으로 선언되어있던 queue 변수를 함수 안으로 옮겨주니 통과ㅏ ..
//struct Queue{
//    var que: [Int] = []
//    mutating func push(_ x: Int) {
//        que.append(x)
//    }
//    mutating func pop() -> Int {
//        que.reverse()
//        if let a = que.popLast() {
//            que.reverse()
//            return a
//        }
//        return 0
//    }
//    func empty() -> Bool {
//        return que.isEmpty
//    }
//    func size() -> Int{
//        return que.count
//    }
//}
//
//let input = readLine()!.split(separator: " ").compactMap { Int($0) }
//let n = input[0]
//let k = input[1]
//func bfs(_ node: Int) -> Int {
//    var visitArray = Array(repeating: false, count: 100001)
//    var depthArray = Array(repeating: 0, count: 100001)
//    var queue = Queue() // 이 변수는 원래 전역으로 있었는데, 그냥 함수 안으로 넣어주니까 통과 되었다. 시간에 영향을 미치나보다 전역변수가... 대박 ..
//    queue.push(node)
//    while queue.empty() == false {
//        let item = queue.pop()
//        if item == k {
//            break
//        }
//        if item > 0 && visitArray[item - 1] == false {
//            visitArray[item - 1] = true
//            depthArray[item - 1] = depthArray[item] + 1
//            queue.push(item - 1)
//        }
//        if item < 100000 && visitArray[item + 1] == false  {
//            visitArray[item + 1] = true
//            depthArray[item + 1] = depthArray[item] + 1
//            queue.push(item + 1)
//        }
//        if item * 2 < 100001 && visitArray[item * 2] == false {
//            visitArray[item * 2] = true
//            depthArray[item * 2] = depthArray[item] + 1
//            queue.push(item * 2)
//        }
//    }
//    return depthArray[k]
//}
//print(bfs(n))

// MARK: - class로 구현한 큐도 시간에 영향을 미친 것 같다
// 참고링크: https://sapjilkingios.tistory.com/107

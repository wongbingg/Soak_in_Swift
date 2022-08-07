// <10866> 덱 구현하기

struct Deque {
    var enqueue: [Int] = []
    var dequeue: [Int] = []
    var size: Int {
        return enqueue.count + dequeue.count
    }
    var empty: Int {
        if enqueue.isEmpty && dequeue.isEmpty {
            return 1
        } else {
            return 0
        }
    }
    var front: Int {
        guard empty == 0 else { return -1 }
        if enqueue.isEmpty == false {
            return enqueue.first!
        } else {
            return dequeue.last!
        }
    }
    var back: Int {
        guard empty == 0 else { return -1 }
        if enqueue.isEmpty {
            return dequeue.first!
        } else {
            return enqueue.last!
        }
    }
    
    mutating func push_front_X(x: Int) {
        if dequeue.isEmpty == false {
            dequeue.append(x)
        } else {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
            dequeue.append(x)
        }
    }
    mutating func push_back_X(x: Int) { // 로직 부실
        enqueue.append(x)
    }
    mutating func pop_front() -> Int {
        guard empty == 0 else { return -1 }
        if dequeue.isEmpty == false {
            return dequeue.popLast()!
        } else {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
            return dequeue.popLast()!
        }
    }
    mutating func pop_back() -> Int {
        guard empty == 0 else { return -1 }
        if enqueue.isEmpty == false {
            return enqueue.popLast()!
        } else {
            enqueue = dequeue.reversed()
            dequeue.removeAll()
            return enqueue.popLast()!
        }
    }
}

var deque = Deque()
var result: [Int] = []
let N = Int(readLine()!)!
(1...N).forEach { _ in
    let order = readLine()!.split(separator: " ")
    switch order[0] {
    case "push_front":
        deque.push_front_X(x: Int(order[1])!)
    case "push_back":
        deque.push_back_X(x: Int(order[1])!)
    case "pop_front":
        result.append(deque.pop_front())
    case "pop_back":
        result.append(deque.pop_back())
    case "size":
        result.append(deque.size)
    case "empty":
        result.append(deque.empty)
    case "front":
        result.append(deque.front)
    case "back":
        result.append(deque.back)
    default:
        return
    }
}

result.forEach { print($0) }

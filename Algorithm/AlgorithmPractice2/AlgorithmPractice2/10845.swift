// <10845> 큐

struct DoubleStack {
    var enqueueStack: [Int] = []
    var dequeueStack: [Int] = []
    var size: Int {
        return enqueueStack.count + dequeueStack.count
    }
    var empty: Int {
        if enqueueStack.isEmpty && dequeueStack.isEmpty {
            return 1
        } else {
            return 0
        }
    }
    var front: Int {
        guard dequeueStack.isEmpty == false || enqueueStack.isEmpty == false else { return -1 }
        if dequeueStack.isEmpty == false {
            return dequeueStack.last!
        } else {
            return enqueueStack.first!
        }
    }
    var back: Int {
        guard dequeueStack.isEmpty == false || enqueueStack.isEmpty == false else { return -1 }
        if enqueueStack.isEmpty {
            return dequeueStack.first!
        } else {
            return enqueueStack.last!
        }
    }
    
    mutating func push(x: Int) {
        enqueueStack.append(x)
    }
    
    mutating func pop() -> Int {
        guard enqueueStack.isEmpty == false || dequeueStack.isEmpty == false else { return -1 }
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()!
    }
}

var result: [Int] = []
var queue = DoubleStack()

let N = Int(readLine()!)!
(1...N).forEach { _ in
    let order = readLine()!.split(separator: " ")
    switch order[0] {
    case "push":
        queue.push(x: Int(order[1])!)
    case "pop":
        result.append(queue.pop())
    case "size":
        result.append(queue.size)
    case "empty":
        result.append(queue.empty)
    case "front":
        result.append(queue.front)
    case "back":
        result.append(queue.back)
    default:
        break
    }
}

result.forEach { print($0)}

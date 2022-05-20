//< 1874 > 스택 수열
// 스택은 LIFO 특성을 가진다.
// 1 부터 n까지의 수를 스택에 넣었다가 뽑아 늘어놓음으로써, 하나의 수열을 만들 수 있다.

let n = Int(readLine()!)!
var comparedList: [Int] = []
for _ in 1...n {
    comparedList.append(Int(readLine()!)!)
}

struct StackQueue {
    
    private var stack = Array<Int>()
    var isEmpty: Bool {
        return stack.isEmpty
    }
    var last: Int? {
        return stack.last
    }
    
    mutating func enqueue(_ element: Int) {
        stack.append(element)
    }
    
    mutating func dequeue() {
        stack.popLast()
    }
}

var stack = StackQueue()
var num = 1 //7
var resultList: [String] = []
for i in comparedList {
    for _ in 1... {
        if num > n + 1 {
            resultList.append("NO")
            break
        }
        if stack.last == i {
            stack.dequeue()
            resultList.append("-")
            break
        }
        stack.enqueue(num)
        resultList.append("+")
        num += 1
    }
}

if resultList.contains("NO") {
    print("NO")
} else {
    resultList.forEach{print($0)}
}


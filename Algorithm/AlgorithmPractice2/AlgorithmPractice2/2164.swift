/*
<2164> 카드2
 N장의 카드가 있다. 1번카드가 제일 위, N번 카드가 제일 밑에
 제일 위의 카드를 버린다, 그다음 카드는 제일 아래로 옮긴다.
 FIFO 방식과 first to last 두개가 섞였다.
*/

struct IntStack {
    private var enqueueStack: [Int]
    private var dequeueStack: [Int] = []
    var count: Int {
        return enqueueStack.count + dequeueStack.count
    }
    var head: Int {
        if dequeueStack.count == 0 {
            return enqueueStack[0]
        } else {
            return dequeueStack[dequeueStack.count - 1]
        }
    }
    
    mutating func enqueue(_ element: Int) {
        enqueueStack.append(element)
    }
    mutating func dequeue() -> Int? {
        if dequeueStack.count == 0 {
            dequeueStack = enqueueStack.reversed()
            enqueueStack = []
        }
        return dequeueStack.popLast()
    }
    mutating func dequeueToLast() {
        let element = dequeue()!
        enqueue(element)
    }
    
    init(enqueuStack: [Int]) {
        self.enqueueStack = enqueuStack
    }
}

let N = Int(readLine()!)!
var intStack = IntStack(enqueuStack: Array<Int>(1...N))

while intStack.count > 1 {
    intStack.dequeue()
    intStack.dequeueToLast()
}
print(intStack.head)
